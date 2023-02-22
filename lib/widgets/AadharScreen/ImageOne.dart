import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
  // Future<String> getFilePath() async {
  //   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
  //   String appDocumentsPath = appDocumentsDirectory.path; // 2
  //   String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3
  //
  //   return filePath;
  // }
  // String filePath = " ";
  //
  // void saveFile(String fileString) async {
  //   filePath = fileString;
  //   File file = File(fileString); // 1
  //
  // }
  // File? data;
  // void readFile() async {
  //   data = File(filePath); // 1
  //
  //
  // }

  @override
  initState() {
    // readFile();
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

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(builder: (context, value, child) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        value.dataValue[0].aadharOne == " "
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Container(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Utility.imageFromBase64String(
                    value.dataValue[0].aadharOne!),
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
              print(imgFile!.readAsBytes().toString().length);
              Uint8List file = await imgFile!.readAsBytes();
              file = await testComporessList(file);
              String imgString = Utility.base64String(file);
              value.setAadharOne(
                  context: context, aadharOne: imgString, id: widget.id);
            });

            // ImagePicker()
            //     .pickImage(source: ImageSource.camera)
            //     .then((imgFile) async {
            //   String file = imgFile!.path;
            //   saveFile(file);
            //   readFile();
            // });
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
