import 'package:cloud_certify/models/certificate_type_model.dart';
import 'package:cloud_certify/pages/upload_to_certify/upload_to_certify_screen.dart';
import 'package:cloud_certify/view_models/doc_type_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectBody extends StatefulWidget {
  @override
  _SelectBodyState createState() => _SelectBodyState();
}

class _SelectBodyState extends State<SelectBody> {
  @override
  void initState() {
    context.read<DocTypeViewModel>().getDocTypeList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final docProvider = context.watch<DocTypeViewModel>();
    List<DocumentTypeModel> docList = docProvider.docTypeList;
    return Padding(
      padding: EdgeInsets.all(16),
      child: docProvider.isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              itemCount: docList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      subtitle: Text('ZWL${docList[index].price}',
                          style: TextStyle(color: Colors.grey)),
                      title: Text('${docList[index].fileType}'),
                      trailing: docProvider.selectedDocId == docList[index].id
                          ? Icon(Icons.check)
                          : null,
                      onTap: () {
                        setState(() {
                          context
                              .read<DocTypeViewModel>()
                              .setSelectedDocId(docList[index].id);
                        });
                      },
                    ),
                    Divider(),
                    if (index + 1 == docList.length) SizedBox(height: 16),
                    (index + 1 == docList.length)
                        ? ElevatedButton(
                            child: Text('Proceed'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple[200],
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: TextStyle(
                                    fontSize: 24, color: Colors.white)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UploadToCertify()));
                            },
                          )
                        : SizedBox(),
                  ],
                );
              },
            ),
    );
  }
}
