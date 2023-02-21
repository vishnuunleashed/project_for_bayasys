import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'occupationDialog.dart';


class OccupationWidget extends StatefulWidget {
  String occupation;
  int id;
   OccupationWidget({required this.occupation,required this.id});

  @override
  State<OccupationWidget> createState() => _OccupationWidgetState();
}

class _OccupationWidgetState extends State<OccupationWidget> {
  occupationDialog(BuildContext context, String occupation,int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => OccupationDialog(
            occupation: occupation,
            id: id,
          ), // This can be any widget.
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return  ListTile(
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
        widget.occupation,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            occupationDialog(context, widget.occupation, widget.id);
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
