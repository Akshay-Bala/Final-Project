import 'package:flutter/material.dart';
import 'package:potholedetect/UpdateProfileScreen.dart';
import 'package:potholedetect/aboutUs.dart';
import 'package:potholedetect/change_password.dart';
import 'package:potholedetect/notification.dart';
import 'package:potholedetect/userhome.dart';

class BottomnavScreen extends StatefulWidget {
  BottomnavScreen({super.key});

  @override
  State<BottomnavScreen> createState() => _BottomnavScreenState();
}

class _BottomnavScreenState extends State<BottomnavScreen> {


  ValueNotifier<int> currentIndex = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
      final pages = [
    UpdateProfileScreen(),
    Userhome(),
    ChangePassword(),
    AboutUsScreen()
  ];
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
      builder: (BuildContext context, value, Widget? child) {return pages[currentIndex.value] ; },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (value) {
          setState(() {
            currentIndex.value = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person ),backgroundColor: Color.fromARGB(255, 31, 2, 145),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Color.fromARGB(255, 31, 2, 145),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.password),backgroundColor: Color.fromARGB(255, 31, 2, 145),label:"Change Password"),
          BottomNavigationBarItem(icon: Icon(Icons.messenger_outline),backgroundColor: Color.fromARGB(255, 31, 2, 145),label: "About us"),

          ])
       

      //  Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Container(
      //   decoration: BoxDecoration(
      //     color: Color.fromARGB(255, 47, 79, 79),
      //     border: Border.all(style: BorderStyle.none),
      //   borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))),
      //   height: 100,
      //   //color: Colors.amber,
      //   child: Container(
      //     child: BottomNavigationBar(
      //       currentIndex: currentIndex.value,
      //       onTap: (value) {
      //         setState(() {
      //           currentIndex.value = value;
      //         });
      //       },
      //       backgroundColor: Colors.white.withOpacity(0),
      //       items: [
              // BottomNavigationBarItem(icon: Icon(Icons.person ),backgroundColor: Color.fromARGB(255, 249, 248, 248),label: "Profile"),
              // BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              // BottomNavigationBarItem(icon: Icon(Icons.notification_add),label: "Notifications"),
      //       ]),
      //   ),
      // ),
      //   ],
      // ),
    );
  }
}