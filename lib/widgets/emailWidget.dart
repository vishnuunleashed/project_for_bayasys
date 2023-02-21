import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'emailDialog.dart';

class EmailWidget extends StatefulWidget {
  String email;
  int id;
  EmailWidget({required this.email,required this.id});

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  emailDialog(BuildContext context, String email,int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => EmailDialog(
            email: email,
            id: id,
          ), // This can be any widget.
        ),
      ),
    );

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8, left: 10),
        child: FaIcon(
          FontAwesomeIcons.solidEnvelope,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        "Email ID",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.email,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {
          emailDialog(context, widget.email,widget.id);

        },
        icon: FaIcon(
          FontAwesomeIcons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
