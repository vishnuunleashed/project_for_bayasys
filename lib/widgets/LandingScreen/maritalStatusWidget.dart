import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'maritalStatusDialog.dart';


class MaritalStatusWidget extends StatelessWidget {
  String maritalStatus;
  int id;
  MaritalStatusWidget({required this.maritalStatus,required this.id});

  maritalStatusDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => MaritalDialog(
           id: id,
          ), // This can be any widget.
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        maritalStatus,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            maritalStatusDialog(context,id);
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
