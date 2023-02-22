//
// import 'package:bayasys/provider/main_data_class.dart';
// import 'package:fluid_dialog/fluid_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import 'package:table_calendar/table_calendar.dart';
//
// import '../../utility/utility.dart';
//
// class MaritalDialog extends StatefulWidget {
//   int id;
//   MaritalDialog({required this.id});
//   @override
//   State<MaritalDialog> createState() => _MaritalDialogState();
// }
//
// class _MaritalDialogState extends State<MaritalDialog> {
//   String? selection;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MainData>(builder: (context, value, child) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//
//                   backgroundColor: selection == "Single"?Theme.of(context).primaryColor:Colors.white
//               ),
//               onPressed: (){
//                 setState(() {
//                   selection = "Single";
//                 });
//               }, child: Text("Single",style: TextStyle(color:selection == "Single"?Colors.white:Colors.black )),),
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//
//                   backgroundColor: selection == "Married"?Theme.of(context).primaryColor:Colors.white
//               ),
//               onPressed: (){
//                 setState(() {
//                   selection = "Married";
//                 });
//               }, child: Text("Married",style: TextStyle(color:selection == "Married"?Colors.white:Colors.black )),),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Theme.of(context).primaryColor),
//                 onPressed: () {
//                   if(selection != null) {
//                     value.setMarital(context: context, maritalStatus: selection!, id: widget.id);
//                   }else{
//                     showError(context, "Select a Marital Status");
//                   }
//                 },
//                 child: Text("Update"))
//           ],
//         ),
//       );
//     });
//   }
// }
