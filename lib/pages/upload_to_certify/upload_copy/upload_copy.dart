import 'dart:convert';
import 'dart:io';
import 'package:cloud_certify/view_models/certify_view_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/models/file_upload_response_model.dart';
import 'package:cloud_certify/pages/upload_to_certify/submission/submission_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class UploadCopy extends StatefulWidget {
  @override
  _UploadCopyState createState() => _UploadCopyState();
}

class _UploadCopyState extends State<UploadCopy> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _fileName;
  String status = '';
  String errMessage = 'Error Uploading Image';

  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _pickFiles(BuildContext context) async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString(), context);
    } catch (e) {
      _logException(e.toString(), context);
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  void _logException(String message, BuildContext context) {
    print(message);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _userAborted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Upload Copy'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      OutlinedButton.icon(
                        icon: Icon(Icons.attach_file),
                        onPressed: () => _pickFiles(context),
                        label: Text('Select file'),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Builder(
                  builder: (BuildContext context) => _isLoading
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator(),
                        )
                      : _userAborted
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: const Text(
                                'User has aborted the dialog',
                              ),
                            )
                          : _directoryPath != null
                              ? ListTile(
                                  title: const Text('Directory path'),
                                  subtitle: Text(_directoryPath!),
                                )
                              : _paths != null
                                  ? Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.60,
                                      child: Scrollbar(
                                          child: ListView.separated(
                                        itemCount:
                                            _paths != null && _paths!.isNotEmpty
                                                ? _paths!.length
                                                : 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath =
                                              _paths != null &&
                                                  _paths!.isNotEmpty;
                                          final String name = 'File $index: ' +
                                              (isMultiPath
                                                  ? _paths!
                                                      .map((e) => e.name)
                                                      .toList()[index]
                                                  : _fileName ?? '...');
                                          final path = kIsWeb
                                              ? null
                                              : _paths!
                                                  .map((e) => e.path)
                                                  .toList()[index]
                                                  .toString();

                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  name,
                                                ),
                                                subtitle: Text(path ?? ''),
                                              ),
                                              SizedBox(height: 40),
                                              Text(
                                                status,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              SizedBox(height: 16.0),
                                              Text(
                                                  'Select upload file, then Proceed'),
                                              SizedBox(height: 8),
                                              OutlinedButton.icon(
                                                  icon: Icon(Icons.upload_file),
                                                  onPressed: () =>
                                                      onUpload(context),
                                                  label: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16),
                                                    child: Text('Upload'),
                                                  )),
                                              SizedBox(height: 80.0),
                                              ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SubmissionScreen()),
                                                      ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 64),
                                                    child: Text('Proceed'),
                                                  )),
                                            ],
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      )),
                                    )
                                  : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setStatus(String txt) {
    setState(() {
      status = txt;
    });
  }

  onUpload(BuildContext context) async {
    setState(() {
      setStatus('Uploading File...');
    });
    String apiUploadFile = apiBaseUrlOath + 'file/upload';
    File selectedFile = File(_paths!.first.path!);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(apiUploadFile),
    );
    Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
    };
    request.files.add(await http.MultipartFile(
      'file',
      selectedFile.readAsBytes().asStream(),
      selectedFile.lengthSync(),
      filename: selectedFile.path.split('/').last,
    ));
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    print('Status code: ${res.statusCode}');
    setStatus(
        res.statusCode == 200 ? 'Successfully uploaded file.' : errMessage);
    http.Response response = await http.Response.fromStream(res);
    print(response.body);
    if (res.statusCode == 200) {
      FileUploadResponseModel fileUploadModel =
          FileUploadResponseModel.fromJson(jsonDecode(response.body));
      print(fileUploadModel.fileName);
      String _fileId = fileUploadModel.fileDownloadUri!.split('/').last;
      print('Copy File id -- $_fileId');
      context.read<CertifyViewModel>().setCopyFileId(_fileId);
    }
  }
}
