import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class TradingExpWidget extends StatefulWidget {
  String tradingExp;
  TradingExpWidget({required this.tradingExp});

  @override
  State<TradingExpWidget> createState() => _TradingExpWidgetState();
}

class _TradingExpWidgetState extends State<TradingExpWidget> {
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
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.black,
          )),
    );
  }
}
