import 'package:assignment_http/models/user_model.dart';
import 'package:flutter/material.dart';

class ProviderApp extends ChangeNotifier {
  UserModel? selectedDataUser;

   void selectUser(UserModel data) {
    selectedDataUser = data;
    notifyListeners();
  }
}


