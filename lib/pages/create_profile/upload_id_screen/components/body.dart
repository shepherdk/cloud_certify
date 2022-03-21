import 'dart:convert';
import 'dart:io';
import 'package:cloud_certify/helpers/constants.dart';
import 'package:cloud_certify/models/file_upload_response_model.dart';
import 'package:cloud_certify/pages/create_profile/create_profile_form/create_profile_form_screen.dart';
import 'package:cloud_certify/view_models/create_profile_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectedImage;
  String status = '';
  var resJson;
  String errMessage = 'Error Uploading Image';

  setStatus(String txt) {
    setState(() {
      status = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Please attach a clear photo ID'),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: chooseImage,
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            if (selectedImage != null) showImage(),
            SizedBox(height: 20.0),
            if (selectedImage != null)
              OutlinedButton(
                onPressed: () => onUploadImage(context),
                // onPressed: startUpload,
                child: Text('Upload Image'),
              ),
            SizedBox(height: 20.0),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            if (selectedImage != null)
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatProfileForm()),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            //if (resJson != null) Text(resJson['message'])
          ],
        ),
      ),
    );
  }

  Future chooseImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  onUploadImage(BuildContext context) async {
    setState(() {
      setStatus('Uploading Image...');
    });
    String apiUploadFile = apiBaseUrlOath + 'file/upload';
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(apiUploadFile),
    );
    Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
    };
    request.files.add(await http.MultipartFile(
      'file',
      selectedImage.readAsBytes().asStream(),
      selectedImage.lengthSync(),
      filename: selectedImage.path.split('/').last,
    ));
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    print('Status code: ${res.statusCode}');
    setStatus(
        res.statusCode == 200 ? 'Successfully uploaded image.' : errMessage);
    http.Response response = await http.Response.fromStream(res);
    print(response.body);
    if (res.statusCode == 200) {
      FileUploadResponseModel fileUploadModel =
          FileUploadResponseModel.fromJson(jsonDecode(response.body));
      String _fileId = fileUploadModel.fileDownloadUri!.split('/').last;
      context.read<CreateProfileViewModel>().setProfileImageId(_fileId);
      print(fileUploadModel.fileName! + '----id is $_fileId');
    }
  }

  Widget showImage() {
    return Flexible(
      child: Image.file(
        selectedImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
