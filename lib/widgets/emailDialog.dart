
import 'package:bayasys/provider/main_data_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailDialog extends StatefulWidget {
  String email;
  EmailDialog({required this.email});


  @override
  State<EmailDialog> createState() => _EmailDialogState();
}

class _EmailDialogState extends State<EmailDialog> {
  TextEditingController textEditingController = TextEditingController();

  updateData(){

  }
  @override
  void initState() {

    textEditingController.text = widget.email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(
      builder: (context,value,child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(

                controller: textEditingController,
                decoration: InputDecoration(

                  contentPadding: EdgeInsets.all(20),

                  hintStyle:
                  TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor)),
                ),
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor
                  ),
                  onPressed: (){
                    value.setEmail(context,textEditingController.text);

                  }, child: Text("Update"))



            ],
          ),
        );
      }
    );
  }
}