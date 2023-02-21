import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'girDialog.dart';


class GrossIncomeRangeWidget extends StatefulWidget {
  String gitValue;
  int id;

  GrossIncomeRangeWidget({required this.gitValue,required this.id});

  @override
  State<GrossIncomeRangeWidget> createState() => _GrossIncomeRangeWidgetState();
}

class _GrossIncomeRangeWidgetState extends State<GrossIncomeRangeWidget> {
  girDialog(BuildContext context,int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => GIRDialog(
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
        widget.gitValue,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            girDialog(context,widget.id);
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
