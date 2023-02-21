import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class GrossIncomeRangeWidget extends StatefulWidget {
  String gitValue;

  GrossIncomeRangeWidget({required this.gitValue});

  @override
  State<GrossIncomeRangeWidget> createState() => _GrossIncomeRangeWidgetState();
}

class _GrossIncomeRangeWidgetState extends State<GrossIncomeRangeWidget> {
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
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
