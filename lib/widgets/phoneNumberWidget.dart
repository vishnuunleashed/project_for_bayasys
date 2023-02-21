import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PhoneNumberWidget extends StatelessWidget {
  String phoneNumber;
  PhoneNumberWidget({required this.phoneNumber});

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
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
