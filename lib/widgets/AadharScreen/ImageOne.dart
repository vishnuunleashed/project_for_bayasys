import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/main_data_class.dart';
import '../../utility/utility.dart';
class ImageOne extends StatefulWidget {
  int id;
  ImageOne({required this.id});

  @override
  State<ImageOne> createState() => _ImageOneState();
}

class _ImageOneState extends State<ImageOne> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(builder: (context, value, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            value.dataValue[0].aadharTwo! == " "
                ? Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: Container(
                child: Center(child: Text("Try Uploading Image")),
              ),
            )
                : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Utility.imageFromBase64String(
                  value.dataValue[0].aadharTwo!),
            ),
            SizedBox(
              height: 50,
            ),
            IconButton(
              onPressed: () async {
                // await ImagePicker().pickImage(source: ImageSource.gallery)
                //     .then((imgFile) async {
                //       String imgString = Utility.base64String(await imgFile!.readAsBytes());
                //       value.setAadharOne(context: context, aadharOne: imgString, id: widget.id);
                //
                // });
                _picker
                    .pickImage(source: ImageSource.camera)
                    .then((imgFile) async {
                  Uint8List file = await imgFile!.readAsBytes();
                  String imgString = Utility.base64String(file);
                  value.setAadharTwo(
                      context: context, aadharTwo: imgString, id: widget.id);
                });
                //
              },
              icon: FaIcon(
                FontAwesomeIcons.file,
                color: Colors.black,
                size: 30,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Upload Image")
          ]);
    });
  }
}
