import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class GenderWidget extends StatelessWidget {
  String gender;
  GenderWidget({required this.gender});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8, left: 10),
        child: FaIcon(
          FontAwesomeIcons.venusMars,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        "Gender",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
       gender,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
