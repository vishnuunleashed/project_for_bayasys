
import 'package:bayasys/provider/main_data_class.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../utility/utility.dart';

class TradingDialog extends StatefulWidget {
  int id;
  TradingDialog({required this.id});
  @override
  State<TradingDialog> createState() => _TradingDialogState();
}

class _TradingDialogState extends State<TradingDialog> {
  String? selection;

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
                  backgroundColor: selection == "0 - 5 years"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "0 - 5 years";
                });
              },
              child: Text(
                "0 - 5 years",
                style: TextStyle(
                    color: selection == "0 - 5 years" ? Colors.white : Colors.black),
              ),
            ),OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "5 - 10 years"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "5 - 10 years";
                });
              },
              child: Text(
                "5 - 10 years",
                style: TextStyle(
                    color: selection == "5 - 10 years" ? Colors.white : Colors.black),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "10 - 15 years"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "10 - 15 years";
                });
              },
              child: Text("10 - 15 years",
                  style: TextStyle(
                      color:
                          selection == "10 - 15 years" ? Colors.white : Colors.black)),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "15 -20 years"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "15 -20 years";
                });
              },
              child: Text("15 -20 years",
                  style: TextStyle(
                      color:
                          selection == "15 -20 years" ? Colors.white : Colors.black)),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: selection == "20+ years"
                      ? Theme.of(context).primaryColor
                      : Colors.white),
              onPressed: () {
                setState(() {
                  selection = "20+ years";
                });
              },
              child: Text("20+ years",
                  style: TextStyle(
                      color:
                          selection == "20+ years" ? Colors.white : Colors.black)),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  if (selection != null) {
                    value.setTrading(
                        context: context, tradingXp: selection!, id: widget.id);
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
