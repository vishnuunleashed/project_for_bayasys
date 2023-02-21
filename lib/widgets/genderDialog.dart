import 'package:bayasys/provider/main_data_class.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

class GenderDialog extends StatefulWidget {
  @override
  State<GenderDialog> createState() => _GenderDialogState();
}

class _GenderDialogState extends State<GenderDialog> {

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
            OutlinedButton(onPressed: (){
                // value.setGender(context: context, gender: "Male", id: id)
            }, child: Text("Male"),),
            OutlinedButton(onPressed: (){
                // value.setGender(context: context, gender: "Male", id: id)
            }, child: Text("Male"),),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  String date = DateFormat('dd-MM-yyyy').format(value.selectedDay!);
                  print(date);
                },
                child: Text("Update"))
          ],
        ),
      );
    });
  }
}
