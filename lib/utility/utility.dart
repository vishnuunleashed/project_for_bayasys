
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';



import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';




void showSuccess(BuildContext context, String message) {

  showTopSnackBar(context, CustomSnackBar.success(message: message),displayDuration: Duration(seconds: 1),curve: Curves.bounceInOut);
}

void showError(BuildContext context, String message) {


  showTopSnackBar(context, CustomSnackBar.error(message: message,textStyle: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),),displayDuration: Duration(seconds: 1),curve: Curves.bounceInOut);
}

void showInfo(BuildContext context, String message) {
  showTopSnackBar(context, CustomSnackBar.info(message: message),
      displayDuration: Duration(seconds: 1));
}

class Utility{
  static String base64String(Uint8List data){
    return base64Encode(data);
  }
  static Image imageFromBase64String(String base64String){
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover,
    );
  }

  static MemoryImage memoryImageFromBase64String(String base64String){
    return MemoryImage(
      base64Decode(base64String),

    );
  }
}
