import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potholedetect/reportaccidentarea.dart';
import 'package:potholedetect/reportpothole.dart';
import 'package:potholedetect/widgets/devicecard.dart';

class Userhome extends StatefulWidget {
  Userhome({super.key});

  @override
  State<Userhome> createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
  bool isCardActive = false;

  void toggleCardActiveState() {
    setState(() {
      isCardActive = !isCardActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 241, 242, 242)),
        backgroundColor: Color.fromARGB(255, 47, 79, 79),
        //actions: [IconButton(onPressed: (){}, icon:Icon(Icons.person),)],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 229, 227, 238),
              Color.fromARGB(255, 47, 79, 79),
            ])),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reportpothole(),));
              },
              child: DeviceCard(
                
                activeColor:Colors.brown,
                deviceIcon: Icons.warning_rounded,
                connectionIcon: Icons.add_a_photo_sharp,
                title: 'Report Potholes',
                subtitle:
                    'Send your location of a pothole area you have encountered',
                //onActivePressed: toggleCardActiveState(),
                initialActiveState: false,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                navigation: Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reportaccidentarea(),));

              },
              child: DeviceCard(
                  activeColor: Colors.brown,
                  deviceIcon: Icons.warning_rounded,
                  connectionIcon: Icons.add_a_photo_sharp,
                  initialActiveState: false,
                  //isActive: true ,
                  title: 'Report Accident prone area',
                  subtitle:
                      'Send your location of a accident prone area you have encountered'),
            ),
            SizedBox(
              height: 10,
            ),
            DeviceCard(
            //  navigation: Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reportpothole(),)),
                activeColor: Colors.brown,
                deviceIcon: Icons.warning_rounded,
                connectionIcon: Icons.add_alert,
                initialActiveState: false,
                //isActive:true ,
                title: 'View Report Status',
                subtitle: 'Current status of the reported complaints')
          ],
        ),
      ),
    );
  }
}
