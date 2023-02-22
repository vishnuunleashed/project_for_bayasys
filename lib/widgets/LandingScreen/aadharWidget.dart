import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages/aadhar_screen.dart';
class AadharWidget extends StatefulWidget {
  String status;
  int id;
  AadharWidget({required this.status,required this.id});

  @override
  State<AadharWidget> createState() => _AadharWidgetState();
}

class _AadharWidgetState extends State<AadharWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: FaIcon(
          FontAwesomeIcons.sun,
          color: Colors.amber,
        ),
      ),
      title: Text(
        "Adhar / Address Proof",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.status,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AadharScreen(id: widget.id)));
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
