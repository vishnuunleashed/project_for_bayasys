
import 'package:bayasys/provider/main_data_class.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../utility/utility.dart';

class GIRDialog extends StatefulWidget {
  int id;
  GIRDialog({required this.id});
  @override
  State<GIRDialog> createState() => _GIRDialogState();
}

class _GIRDialogState extends State<GIRDialog> {
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
                  backgroundColor: selection == "0 - 5 Lakhs"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "0 - 5 Lakhs";
                });
              },
              child: Text(
                "0 - 5 Lakhs",
                style: TextStyle(
                    color: selection == "0 - 5 Lakhs" ? Colors.white : Colors.black),
              ),
            ),OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "5 - 10 Lakhs"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "5 - 10 Lakhs";
                });
              },
              child: Text(
                "5 - 10 Lakhs",
                style: TextStyle(
                    color: selection == "5 - 10 Lakhs" ? Colors.white : Colors.black),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "10 - 15 Lakhs"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "10 - 15 Lakhs";
                });
              },
              child: Text("10 - 15 Lakhs",
                  style: TextStyle(
                      color:
                      selection == "10 - 15 Lakhs" ? Colors.white : Colors.black)),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "15 -20 Lakhs"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "15 -20 Lakhs";
                });
              },
              child: Text("15 -20 Lakhs",
                  style: TextStyle(
                      color:
                      selection == "15 -20 Lakhs" ? Colors.white : Colors.black)),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "20+ Lakhs"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "20+ Lakhs";
                });
              },
              child: Text("20+ Lakhs",
                  style: TextStyle(
                      color:
                      selection == "20+ Lakhs" ? Colors.white : Colors.black)),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  if (selection != null) {
                    value.setGIR(
                        context: context, gir: selection!, id: widget.id);
                  } else {
                    showError(context, "Select a Range");
                  }
                },
                child: Text("Update"))
          ],
        ),
      );
    });
  }
}
