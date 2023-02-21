
import 'package:bayasys/widgets/LandingScreen/phoneNumberDialog.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PhoneNumberWidget extends StatelessWidget {
  String phoneNumber;
  int id;
  PhoneNumberWidget({required this.phoneNumber,required this.id});

  phoneDialog(BuildContext context, String phoneNumber,int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => PhoneNumberDialog(
            phone: phoneNumber,
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
          FontAwesomeIcons.mobileRetro,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        "Phone Number",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        phoneNumber,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {
          phoneDialog(context, phoneNumber, id);
        },
        icon: FaIcon(
          FontAwesomeIcons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
