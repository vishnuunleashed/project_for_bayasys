

import 'package:bayasys/dialog/showSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/main_data_modal.dart';

class MainData extends ChangeNotifier{
  static String email = "demo@demo.com";
  static String password = "";
  List<MainDataModal> dataValue = [];


  setEmail(BuildContext context,String email){
    MainData.email = email;
    Navigator.of(context).pop();
    notifyListeners();
  }

  static late Database db;

  static Future<void> initializeDatabase() async {
    db = await openDatabase(

        'one.db',
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE profile (id INTEGER PRIMARY KEY, name TEXT,password TEXT, email TEXT,phone TEXT,gender TEXT,dob TEXT,maritalStatus TEXT,occupation TEXT,tradingXp TEXT,gir TEXT,address TEXT,profilePic TEXT,aadharOne TEXT,aadharTwo Text,panPic TEXT)');
        });
  }

  Future<void> insertInToDB({required String name,required String email,required String phone,required String gender,required String dob,required String maritalStatus,required String occupation,required String tradingXp,required String gir,required String address,required String profilePic,required String aadharOne,required String aadharTwo,required String panPic}) async {
    await db.rawQuery("INSERT INTO profile(name,email,phone,gender,dob,maritalStatus,occupation,tradingXp,gir,address,profilePic,aadharOne,aadharTwo,panPic) VALUES('$name','$email','$phone','$gender','$dob','$maritalStatus','$occupation','$tradingXp','$gir','$address','$profilePic','$aadharOne','$aadharTwo','$panPic')");
    getDataFromDB();
  }

  Future<void> insertAtRegister({required BuildContext context,required String email,required String password}) async {
    final responses = await db.rawQuery(
        "SELECT * FROM profile WHERE email = '$email' AND password = '$password' ");
    getDataFromDB();
    if (responses.length == 0){
      await db.rawQuery("INSERT INTO profile(email,password) VALUES('$email','$password')");
      getDataFromDB();
    }else{

      showError(context, "Email id exits");

    }

  }

  Future login({required String email,required String password}) async {
    MainData.email = email;
    MainData.password = password;

    final responses = await db.rawQuery(
        "SELECT * FROM profile WHERE email = '$email' AND password = '$password' ");
    getDataFromDB();
    if (responses.length == 1){
      if (responses.isNotEmpty) {

        responses.forEach((element) {
          dataValue.add(MainDataModal.fromJson(element));
        });
        return true;
      } else {
        return false;
      }
    }else{
      return false;

    }

  }

  Future<void> updateDB({required int id,required String name,required String email,required String phone,required String gender,required String dob,required String maritalStatus,required String occupation,required String tradingXp,required String gir,required String address,required String profilePic,required String aadharOne,required String aadharTwo,required String panPic}) async {
    await db.rawQuery("UPDATE profile SET name = '$name',email = '$email',phone = '$phone',gender = '$gender',dob = '$dob',maritalStatus = '$maritalStatus',occupation = '$occupation',tradingXp = '$tradingXp',gir = '$gir',address = '$address') where id = $id");
    getDataFromDB();
  }


  Future<void> getDataFromDB() async {
    final responses = await db.rawQuery("SELECT * FROM profile WHERE email = '${email}' AND password = '${password}' ");
    print(responses);
    responses.forEach((element) {
      dataValue.add(MainDataModal.fromJson(element));
    });


  }


}