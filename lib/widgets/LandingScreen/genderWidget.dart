
import 'package:bayasys/provider/main_data_class.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'genderDialog.dart';

class GenderWidget extends StatelessWidget {
  String gender;
  int id;
  GenderWidget({required this.gender, required this.id});

  // genderDialog(BuildContext context, int id) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => FluidDialog(
  //       // Set the first page of the dialog.
  //       rootPage: FluidDialogPage(
  //         alignment: Alignment.center, //Aligns the dialog to the bottom left.
  //         builder: (context) => GenderDialog(
  //           id: id,
  //         ), // This can be any widget.
  //       ),
  //     ),
  //   );
  // }

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
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        gender,
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
              case MenuItems.male:
                context.read<MainData>().setGender(context: context, gender: "Male", id: id);
                break;

              case MenuItems.female:
                context.read<MainData>().setGender(context: context, gender: "Female", id: id);
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
      //   onPressed: () {
      //     genderDialog(context,id);
      //     },
      //   icon: FaIcon(
      //     FontAwesomeIcons.edit,
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [male, female];


  static const male = MenuItem(text: 'Male', icon: FontAwesomeIcons.person);
  static const female = MenuItem(text: 'Female', icon: FontAwesomeIcons.personDress);


  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
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
