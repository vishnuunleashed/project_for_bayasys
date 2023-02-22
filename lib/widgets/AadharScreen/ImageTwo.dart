import 'dart:typed_data';

import 'package:bayasys/provider/main_data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../utility/utility.dart';

class ImageTwo extends StatefulWidget {
  int id;
  ImageTwo({required this.id});

  @override
  State<ImageTwo> createState() => _ImageTwoState();
}

class _ImageTwoState extends State<ImageTwo> {
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  Future<Uint8List> testComporessList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 800,
      minWidth: 768,
      quality: 96,
      rotate: 0,
    );
    print(list.length);
    print(result.length);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(builder: (context, value, child) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        value.dataValue[0].aadharTwo! == " "
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Container(),
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
            _picker.pickImage(source: ImageSource.camera).then((imgFile) async {
              Uint8List file = await imgFile!.readAsBytes();
              file = await testComporessList(file);
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
