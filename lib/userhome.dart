import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/reportaccidentarea.dart';
import 'package:potholedetect/reportpothole.dart';
import 'package:potholedetect/reports.dart';
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
  iconTheme: IconThemeData(color: Color.fromARGB(255, 248, 249, 249)),
  backgroundColor: Color.fromARGB(255, 31, 2, 145),
  actions: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'Logout',
        style: TextStyle(color: Colors.white),
      ),
    ),
    IconButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
      },
      icon: Icon(Icons.logout),
    ),
  ],
),

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 248, 249, 249),
              Color.fromARGB(255, 31, 2, 145),
            ])),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reportpothole(),));
              },
              child: DeviceCard(
                
                activeColor:Colors.yellow,
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
                  activeColor: Colors.yellow,
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
            InkWell(
              onTap: (){
                navigation:Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reports(),));
              },
              child: DeviceCard(
              //  navigation: Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reportpothole(),)),
                  activeColor: Colors.yellow,
                  deviceIcon: Icons.warning_rounded,
                  connectionIcon: Icons.add_alert,
                  initialActiveState: false,
                  //isActive:true ,
                  title: 'View Report Status',
                  subtitle: 'Current status of the reported complaints'),
            )
          ],
        ),
      ),
    );
  }
}
