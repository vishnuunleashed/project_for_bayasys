// import 'package:sqflite/sqflite.dart';
//
// import '../modal/main_data_modal.dart';
//
// class DataBaseClass {
//
//   static late Database db;
//
//   static Future<void> initializeDatabase() async {
//     db = await openDatabase(
//
//         'local.db',
//         version: 1,
//         onCreate: (Database db, int version) async {
//           await db.execute(
//               'CREATE TABLE profile (id INTEGER PRIMARY KEY, name TEXT, email TEXT,phone TEXT,gender TEXT,dob TEXT,maritalStatus TEXT,occupation TEXT,tradingXp TEXT,gir TEXT,address TEXT,profilePic TEXT,aadharOne TEXT,aadharTwo Text,panPic TEXT)');
//         });
//   }
//
//   static Future<void> insertInToDB({required String name,required String email,required String phone,required String gender,required String dob,required String maritalStatus,required String occupation,required String tradingXp,required String gir,required String address,required String profilePic,required String aadharOne,required String aadharTwo,required String panPic}) async {
//     await db.rawQuery("INSERT INTO profile(name,email,phone,gender,dob,maritalStatus,occupation,tradingXp,gir,address,profilePic,aadharOne,aadharTwo,panPic) VALUES('$name','$email','$phone','$gender','$dob','$maritalStatus','$occupation','$tradingXp','$gir','$address','$profilePic','$aadharOne','$aadharTwo','$panPic')");
//     getDataFromDB();
//   }
//
//   static Future<void> updateDB({required int id,required String name,required String email,required String phone,required String gender,required String dob,required String maritalStatus,required String occupation,required String tradingXp,required String gir,required String address,required String profilePic,required String aadharOne,required String aadharTwo,required String panPic}) async {
//     await db.rawQuery("UPDATE profile SET name = '$name',email = '$email',phone = '$phone',gender = '$gender',dob = '$dob',maritalStatus = '$maritalStatus',occupation = '$occupation',tradingXp = '$tradingXp',gir = '$gir',address = '$address') where id = $id");
//     getDataFromDB();
//   }
//   static List<MainDataModal> dataValue = [];
//   static Future<void> getDataFromDB() async {
//     final data = await db.rawQuery("SELECT * FROM profile");
//     print(data);
//     data.forEach((element) {
//       dataValue.add(MainDataModal.fromJson(element));
//     });
//     print(dataValue[0].name);
//
//   }
//
//
// }