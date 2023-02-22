


import 'package:bayasys/pages/aadhar_screen.dart';
import 'package:bayasys/pages/landing_screen.dart';
import 'package:bayasys/pages/pan_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/main_data_modal.dart';
import '../utility/utility.dart';

class MainData extends ChangeNotifier{
     String email = "";
     String password = "";
  List<MainDataModal> dataValue = [];

  DateTime? selectedDay;

  void setSelectedDay(DateTime date){
    selectedDay = date;
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

  }

  Future<void> insertAtRegister({required BuildContext context,required String email,required String password}) async {
    final responses = await db.rawQuery(
        "SELECT * FROM profile WHERE email = '$email' AND password = '$password' ");
    print(responses);
    if (responses.length == 0){
      await db.rawQuery("INSERT INTO profile(email,password) VALUES('$email','$password')");

    }else{

      showError(context, "Email id exits");

    }

  }

  Future login({required BuildContext context,required String email,required String password}) async {
    this.email = email;
    this.password = password;

    final responses = await db.rawQuery(
        "SELECT * FROM profile WHERE email = '$email' AND password = '$password' ");
    print(responses);
    if (responses.length == 1){
      if (responses.isNotEmpty) {
        dataValue.clear();
        responses.forEach((element) {
          dataValue.add(MainDataModal.fromJson(element));
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LandingScreen(id: dataValue[0].id!,)));

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
    getDataFromDB(id: id);
  }


  Future<void> getDataFromDB({required int id}) async {
    final responses = await db.rawQuery("SELECT * FROM profile WHERE id = $id");

    dataValue.clear();
    responses.forEach((element) {
      dataValue.add(MainDataModal.fromJson(element));
    });


  }

     setEmail({required BuildContext context,required String email,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET email = '$email' where id = $id");
       print(response);
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }

     setPhone({required BuildContext context,required String phone,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET phone = '$phone' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }

     setGender({required BuildContext context,required String gender,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET gender = '$gender' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }

     setDOB({required BuildContext context,required String dob,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET dob = '$dob' where id = $id");
       getDataFromDB(id: id);

       notifyListeners();
     }

     setMarital({required BuildContext context,required String maritalStatus,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET maritalStatus = '$maritalStatus' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }
     setOccupation({required BuildContext context,required String occupation,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET occupation = '$occupation' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }

     setAddress({required BuildContext context,required String address,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET address = '$address' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }


     setGIR({required BuildContext context,required String gir,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET gir = '$gir' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }


     setTrading({required BuildContext context,required String tradingXp,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET tradingXp = '$tradingXp' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }


     setAadharOne({required BuildContext context,required String aadharOne,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET aadharOne = '$aadharOne' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AadharScreen(id: id,index: 1,)));
       notifyListeners();
     }

     setAadharTwo({required BuildContext context,required String aadharTwo,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET aadharTwo = '$aadharTwo' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AadharScreen(id: id,index: 0,)));
       notifyListeners();
     }


     setPanPic({required BuildContext context,required String panPic,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET panPic = '$panPic' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PanScreen(id: id)));
       notifyListeners();
     }

     setProfilePic({required BuildContext context,required String profilePic,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET profilePic = '$profilePic' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LandingScreen(  id: id,)));
       notifyListeners();
     }


     setName({required BuildContext context,required String name,required int id}) async {
       final response = await db.rawQuery("UPDATE profile SET name = '$name' where id = $id");
       getDataFromDB(id: id);
       Navigator.of(context).pop();
       notifyListeners();
     }



}