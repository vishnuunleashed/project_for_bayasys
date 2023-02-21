import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'addressDialog.dart';

class AddressWidget extends StatefulWidget {
  String address;
  int id;
  AddressWidget({required this.address,required this.id});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  addressDialog(BuildContext context, String address,int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => AddressDialog(
            address: address,
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
        widget.address,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            addressDialog(context,widget.address,widget.id);
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
