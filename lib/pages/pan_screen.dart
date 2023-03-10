import 'dart:typed_data';

import 'package:bayasys/provider/main_data_class.dart';
import 'package:bayasys/widgets/AadharScreen/ImageOne.dart';
import 'package:bayasys/widgets/AadharScreen/ImageTwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../utility/utility.dart';
import 'landing_screen.dart';

class PanScreen extends StatefulWidget {
  int id;
  PanScreen({required this.id});

  @override
  State<PanScreen> createState() => _PanScreenState();
}

class _PanScreenState extends State<PanScreen> {
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
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LandingScreen(
                        id: widget.id,
                      )));
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pan Image",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
        ),
        body: Consumer<MainData>(builder: (context, value, child) {
          return Column(children: [
            value.dataValue[0].panPic! == " "
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    child: Container(),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Utility.imageFromBase64String(
                        value.dataValue[0].panPic!),
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
                  file = await testComporessList(file);
                  String imgString = Utility.base64String(file);
                  value.setPanPic(
                      context: context, panPic: imgString, id: widget.id);
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
        }));
  }
}
