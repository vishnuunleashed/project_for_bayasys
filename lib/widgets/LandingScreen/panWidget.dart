import 'package:bayasys/pages/pan_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PanWidget extends StatefulWidget {
  String status;
  int id;
  PanWidget({required this.status,required this.id});

  @override
  State<PanWidget> createState() => _PanWidgetState();
}

class _PanWidgetState extends State<PanWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: FaIcon(
          FontAwesomeIcons.buildingColumns,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        "Pan ID",
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PanScreen(id: widget.id)));

          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
