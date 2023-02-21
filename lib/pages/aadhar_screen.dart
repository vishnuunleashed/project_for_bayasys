import 'package:bayasys/widgets/AadharScreen/ImageOne.dart';
import 'package:bayasys/widgets/AadharScreen/ImageTwo.dart';
import 'package:flutter/material.dart';
class AadharScreen extends StatefulWidget {
  int id;
  int index;
  AadharScreen({required this.id,required this.index});

  @override
  State<AadharScreen> createState() => _AadharScreenState();
}

class _AadharScreenState extends State<AadharScreen> {
  int bottomNavBarIndex = 0;
  @override
  void initState() {
    bottomNavBarIndex = widget.index!;
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
