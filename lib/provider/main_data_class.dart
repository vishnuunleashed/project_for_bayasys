

import 'package:flutter/material.dart';

class MainData extends ChangeNotifier{
  String email = "demo@demo.com";

  setEmail(BuildContext context,String email){
    this.email = email;
    Navigator.of(context).pop();
    notifyListeners();
  }




}