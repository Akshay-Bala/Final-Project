import 'dart:math';

import 'package:flutter/material.dart';
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
        backgroundColor: Color.fromARGB(255,47,79,79),
        //actions: [IconButton(onPressed: (){}, icon:Icon(Icons.person),)],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 229, 227, 238),
              Color.fromARGB(255, 25, 19, 66),
      
            ])
        ),
        child: Column(
          children: [
            DeviceCard(
                                            activeColor: Colors.cyan, 
                                            deviceIcon: Icons.warning_rounded,
                                            connectionIcon: Icons.add_a_photo_sharp,
                                            title: 'Report Potholes',
                                            subtitle: 'capture the location and add details to help us locate and repair potholes',
                                            //onActivePressed: toggleCardActiveState(), 
                                            initialActiveState: false,
                                            ),
                                            SizedBox(height: 10,),
                                            
                                          
                      DeviceCard(
                                            activeColor: Colors.cyan, 
                                            deviceIcon: Icons.warning_rounded,
                                            connectionIcon: Icons.add_a_photo_sharp,
                                            initialActiveState: false,
                                            //isActive: true ,
                                            title: 'Report Accident prone area',
                                            subtitle: 'capture the location and add details to help us locate accident prone areas'),
                                            SizedBox(height: 10,),
                       DeviceCard(
                                            activeColor: Colors.cyan, 
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