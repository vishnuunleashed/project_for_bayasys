import 'package:bayasys/widgets/LandingScreen/tradingExpDialog.dart';

import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class TradingExpWidget extends StatefulWidget {
  String tradingExp;
  int id;
  TradingExpWidget({required this.tradingExp,required this.id});

  @override
  State<TradingExpWidget> createState() => _TradingExpWidgetState();
}

class _TradingExpWidgetState extends State<TradingExpWidget> {
  tradingDialog(BuildContext context,int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => TradingDialog(
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
          FontAwesomeIcons.chartBar,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        "Trading Experience",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
          widget.tradingExp,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
          onPressed: () {
            tradingDialog(context,widget.id);
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
