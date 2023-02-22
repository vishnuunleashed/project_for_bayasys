import 'package:bayasys/widgets/LandingScreen/tradingExpDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/main_data_class.dart';
class TradingExpWidget extends StatefulWidget {
  String tradingExp;
  int id;
  TradingExpWidget({required this.tradingExp,required this.id});

  @override
  State<TradingExpWidget> createState() => _TradingExpWidgetState();
}

class _TradingExpWidgetState extends State<TradingExpWidget> {
  // tradingDialog(BuildContext context,int id) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => FluidDialog(
  //       // Set the first page of the dialog.
  //       rootPage: FluidDialogPage(
  //         alignment: Alignment.center, //Aligns the dialog to the bottom left.
  //         builder: (context) => TradingDialog(
  //           id: id,
  //         ), // This can be any widget.
  //       ),
  //     ),
  //   );
  //
  // }
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
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: Padding(
            padding: const EdgeInsets.only(right: 13.75),
            child: const FaIcon(
              FontAwesomeIcons.edit,
              color: Colors.black,

            ),
          ),
          customItemsHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),


          ],
          items: [
            ...MenuItems.firstItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),

          ],
          onChanged: (value) {
            switch (value) {
              case MenuItems.one:
                context.read<MainData>().setTrading(
                    context: context, tradingXp: "0 - 5 years", id: widget.id);
                break;

              case MenuItems.two:
                context.read<MainData>().setTrading(
                    context: context, tradingXp: "5 - 10 years", id: widget.id);
                break;
              case MenuItems.three:
                context.read<MainData>().setTrading(
                    context: context, tradingXp: "10 - 15 years", id: widget.id);
                break;
              case MenuItems.four:
                context.read<MainData>().setTrading(
                    context: context, tradingXp: "15 -20 years ", id: widget.id);
                break;
              case MenuItems.fifth:
                context.read<MainData>().setTrading(
                    context: context, tradingXp: "20+ years", id: widget.id);
                break;

            }

          },
          itemHeight: 48,
          itemPadding: const EdgeInsets.only(left: 16, right: 16),
          dropdownWidth: 160,
          dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).primaryColor,
          ),
          dropdownElevation: 8,
          offset: const Offset(0, 8),
        ),
      ),
      // trailing: IconButton(
      //     onPressed: () {
      //       tradingDialog(context,widget.id);
      //     },
      //     icon: FaIcon(
      //       FontAwesomeIcons.edit,
      //       color: Colors.black,
      //     )),
    );
  }
}

class MenuItem {
  final String text;


  const MenuItem({
    required this.text,

  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [one, two,three,four,fifth];


  static const one = MenuItem(text: '0 - 5 years');
  static const two = MenuItem(text: '5 -10 years');
  static const three = MenuItem(text: '10 - 15 years');
  static const four = MenuItem(text: '15 - 20 years');
  static const fifth = MenuItem(text: '20+ years');


  static Widget buildItem(MenuItem item) {
    return Row(
      children: [

        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }


}
