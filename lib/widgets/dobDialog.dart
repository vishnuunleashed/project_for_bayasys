import 'package:bayasys/provider/main_data_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

class DOBDialog extends StatefulWidget {
  @override
  State<DOBDialog> createState() => _DOBDialogState();
}

class _DOBDialogState extends State<DOBDialog> {
  DateTime? _selectedDay;
  updateData() {}
  @override
  void initState() {
    super.initState();
  }
  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              selectedDayPredicate: (day) {

                return isSameDay(value.selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                value.setSelectedDay(focusedDay);



              },
              calendarStyle: CalendarStyle(

                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),


              ),

              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: value.selectedDay != null ? value.selectedDay! : DateTime.now(),
              headerStyle: HeaderStyle(
                leftChevronIcon: SizedBox(),
                rightChevronIcon: SizedBox(),
                titleCentered: true,
                // titleTextFormatter: (date, locale) => DateFormat.yMMM(locale).format(date),
                formatButtonVisible: false,
              ),
            ),
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
