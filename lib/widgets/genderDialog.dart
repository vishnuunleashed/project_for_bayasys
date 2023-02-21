import 'package:bayasys/dialog/showSnackBar.dart';
import 'package:bayasys/provider/main_data_class.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

class GenderDialog extends StatefulWidget {
  int id;
  GenderDialog({required this.id});
  @override
  State<GenderDialog> createState() => _GenderDialogState();
}

class _GenderDialogState extends State<GenderDialog> {
  String? selection;
  updateData() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(

                backgroundColor: selection == "Male"?Theme.of(context).primaryColor:Colors.white
              ),
              onPressed: (){
              setState(() {
                selection = "Male";
              });
            }, child: Text("Male",style: TextStyle(color:selection == "Male"?Colors.white:Colors.black )),),
            OutlinedButton(
              style: OutlinedButton.styleFrom(

                  backgroundColor: selection == "Female"?Theme.of(context).primaryColor:Colors.white
              ),
              onPressed: (){
              setState(() {
                selection = "Female";
              });
              }, child: Text("Female",style: TextStyle(color:selection == "Female"?Colors.white:Colors.black )),),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  if(selection != null) {
                    value.setGender(context: context, gender: selection!, id: widget.id);
                  }else{
                    showError(context, "Select a Gender");
                  }
                },
                child: Text("Update"))
          ],
        ),
      );
    });
  }
}
