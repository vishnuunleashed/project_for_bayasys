import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/main_data_class.dart';
import 'girDialog.dart';


class GrossIncomeRangeWidget extends StatefulWidget {
  String gitValue;
  int id;

  GrossIncomeRangeWidget({required this.gitValue,required this.id});

  @override
  State<GrossIncomeRangeWidget> createState() => _GrossIncomeRangeWidgetState();
}

class _GrossIncomeRangeWidgetState extends State<GrossIncomeRangeWidget> {
  // girDialog(BuildContext context,int id) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => FluidDialog(
  //       // Set the first page of the dialog.
  //       rootPage: FluidDialogPage(
  //         alignment: Alignment.center, //Aligns the dialog to the bottom left.
  //         builder: (context) => GIRDialog(
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
                context.read<MainData>().setGIR(
                    context: context, gir: "0 - 5 Lakhs", id: widget.id);
                break;

              case MenuItems.two:
                context.read<MainData>().setGIR(
                    context: context, gir: "5 - 10 Lakhs", id: widget.id);
                break;
              case MenuItems.three:
                context.read<MainData>().setGIR(
                    context: context, gir: "10 - 15 Lakhs", id: widget.id);
                break;
              case MenuItems.four:
                context.read<MainData>().setGIR(
                    context: context, gir: "15 -20 Lakhs ", id: widget.id);
                break;
              case MenuItems.fifth:
                context.read<MainData>().setGIR(
                    context: context, gir: "20+ Lakhs", id: widget.id);
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
      //       girDialog(context,widget.id);
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


  static const one = MenuItem(text: '0 - 5 Lakhs');
  static const two = MenuItem(text: '5 -10 Lakhs');
  static const three = MenuItem(text: '10 - 15 Lakhs');
  static const four = MenuItem(text: '15 - 20 Lakhs');
  static const fifth = MenuItem(text: '20+ Lakhs');


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
