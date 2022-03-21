import 'dart:convert';

import 'package:cloud_certify/models/certificate_type_model.dart';
import 'package:cloud_certify/services/document_type_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocTypeViewModel with ChangeNotifier {
  List<DocumentTypeModel> docTypeList = [];
  int _selectedDocId = 1;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  get selectedDocId => _selectedDocId;

  //set it from the tracking screen, the initial one
  setSelectedDocId(selectedDocId) {
    _selectedDocId = selectedDocId;
    notifyListeners();
  }
  // context.read<DocTypeViewModel>().selectedDocId(3);

  Future<void> getDocTypeList(BuildContext context) async {
    Future.delayed(Duration(milliseconds: 0));
    setIsLoading(true);
    try {
      var _response = await DocumentTypeService().fetchAll();

      var _docList = _response['responseBody'];
      print(_docList.toString());
      if (_docList != null) {
        docTypeList = documentTypeModelFromJson(jsonEncode(_docList));
        print(docTypeList.toString());
        notifyListeners();
      }
    } catch (e) {
      print('Error while getting doc type list $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
    setIsLoading(false);
  }
}
