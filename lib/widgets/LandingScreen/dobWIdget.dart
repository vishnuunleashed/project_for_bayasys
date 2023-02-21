import 'package:bayasys/provider/main_data_class.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



class DOBWidget extends StatefulWidget {
  String dob;
  int id;
  DOBWidget({required this.id,required this.dob});

  @override
  State<DOBWidget> createState() => _DOBWidgetState();
}

class _DOBWidgetState extends State<DOBWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(
      builder: (context,value,child) {
        return ListTile(
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
            widget.dob,
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1947, 15, 7),
                  maxTime: DateTime(2023, 15, 7), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (input) {
                    String date = DateFormat('dd-MM-yyyy').format(input).toString();
                    value.setDOB(context: context, dob: date, id: widget.id);


                  }, currentTime: DateTime.now(), locale: LocaleType.en);

              // dobDialog(context,widget.id);
            },
            icon: FaIcon(
              FontAwesomeIcons.edit,
              color: Colors.black,
            ),
          ),
        );
      }
    );
  }
}
