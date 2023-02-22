import 'package:bayasys/pages/landing_screen.dart';
import 'package:bayasys/widgets/AadharScreen/ImageOne.dart';
import 'package:bayasys/widgets/AadharScreen/ImageTwo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/main_data_class.dart';
class AadharScreen extends StatefulWidget {
  int id;

  AadharScreen({required this.id});

  @override
  State<AadharScreen> createState() => _AadharScreenState();
}

class _AadharScreenState extends State<AadharScreen> {
  int bottomNavBarIndex = 0;
  @override
  void initState() {

    context.read<MainData>().getDataFromDB(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        currentIndex: bottomNavBarIndex,
        type:
        BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          print(value);
         if (value == 0) {
           setState(() {
             bottomNavBarIndex = 0;
           });
          }
          if (value == 1) {
            setState(() {
              bottomNavBarIndex = 1;
            });
          }

        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image One'),

          BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image Two'),

        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LandingScreen(id: widget.id,)));
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
                  "Aadhar Image",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
      ),
      body: Column(
        children: [
          bottomNavBarIndex == 0?ImageOne(id: widget.id ,):ImageTwo(id: widget.id,)

        ],
      ),
    );
  }
}
