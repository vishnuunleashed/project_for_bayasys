import 'package:bayasys/provider/main_data_class.dart';
import 'package:bayasys/sqflite/main_db.dart';
import 'package:bayasys/widgets/emailWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:provider/provider.dart';

import '../widgets/emailDialog.dart';
import '../widgets/genderWidget.dart';
import '../widgets/phoneNumberWidget.dart';
import '../widgets/userIdWidget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // MainData.insertInToDB(name: "vishnu", email: "admin@demo.com", phone: "1234567890", gender: "male", dob: "09/02/2023", maritalStatus: "single", occupation: "IT", tradingXp: "NIl", gir: "Nil", address: "Thodupuzha", profilePic: "123", aadharOne: "123"  , aadharTwo: "123", panPic: "123");
    context.read<MainData>().getDataFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User Profile",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
      ),
      body: Consumer<MainData>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          CircleAvatar(
                            radius: 40,
                            foregroundImage: AssetImage('assets/avatar.png'),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User Name",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "demo@demo.com",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.edit,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "PERSONAL INFO",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
              UserIdWidget(id: value.dataValue[0].id!),
              EmailWidget(email: value.dataValue[0].email!),
              PhoneNumberWidget(phoneNumber: value.dataValue[0].phone!),
              GenderWidget(gender: value.dataValue[0].gender!),
              ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: FaIcon(
                      FontAwesomeIcons.calendarDays,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  title: Text(
                    "Date of Birth",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "20/02/2023",
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.edit,
                        color: Colors.black,
                      ))),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.userGroup,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(
                  "Marital Status",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Single",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.suitcase,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(
                  "Occupation",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "IT",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.chartBar,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(
                  "Trading Experience",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "1-3 years",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.circleDollarToSlot,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(
                  "Gross Income Range",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "More than 25 Lakh",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.home,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(
                  "Address",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Bayasys",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.sun,
                    color: Colors.amber,
                  ),
                ),
                title: Text(
                  "Adhar / Address Proof",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Photo Uploaded",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.buildingColumns,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(
                  "Pan ID",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Photo Uploaded",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {},
                      child: Text("Submit")),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      }),
    );
  }
}
