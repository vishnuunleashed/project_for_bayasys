import 'dart:typed_data';

import 'package:bayasys/provider/main_data_class.dart';
import 'package:bayasys/utility/utility.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'nameUpdateDialog.dart';

class ProfileNameAndPicWidget extends StatefulWidget {
  String name;
  String email;
  String imageUrl;
  int id;

  ProfileNameAndPicWidget(
      {required this.id,
      required this.name,
      required this.email,
      required this.imageUrl});

  @override
  State<ProfileNameAndPicWidget> createState() =>
      _ProfileNameAndPicWidgetState();
}

class _ProfileNameAndPicWidgetState extends State<ProfileNameAndPicWidget> {
  final ImagePicker _picker = ImagePicker();

  nameDialog(BuildContext context, String name, int id) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        // Set the first page of the dialog.
        rootPage: FluidDialogPage(
          alignment: Alignment.center, //Aligns the dialog to the bottom left.
          builder: (context) => NameDialog(
            name: name,
            id: id,
          ), // This can be any widget.
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainData>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: widget.imageUrl == " "
                        ? Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                foregroundImage: AssetImage("assets/avatar.png")
                                   
                              ),
                              FaIcon(
                                FontAwesomeIcons.edit,
                                color: Colors.black,
                              )
                            ],
                          )
                        : Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                foregroundImage:
                                    Utility.memoryImageFromBase64String(
                                        widget.imageUrl),
                              ),
                              FaIcon(
                                FontAwesomeIcons.edit,
                                color: Colors.black,
                              )
                            ],
                          ),
                    onTap: (){
                      _picker
                          .pickImage(source: ImageSource.gallery)
                          .then((imgFile) async {
                        Uint8List file = await imgFile!.readAsBytes();
                        String imgString = Utility.base64String(file);
                        value.setProfilePic(
                            context: context, profilePic: imgString, id: widget.id);
                      });
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                    onPressed: () {
                      nameDialog(context, widget.name, widget.id);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
