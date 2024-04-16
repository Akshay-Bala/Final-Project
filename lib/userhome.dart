import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/reportaccidentarea.dart';
import 'package:potholedetect/reportpothole.dart';
import 'package:potholedetect/reports.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/api/viewreportsapi.dart';
import 'package:potholedetect/widgets/devicecard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class Userhome extends StatefulWidget {
  Userhome({super.key});

  @override
  State<Userhome> createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
  bool isCardActive = false;

@override
  void initState() {
    _enableLocationServices();
    super.initState();
  }
 
  // permission
  Future<void> _enableLocationServices() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // If location services are not enabled, open the location settings
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        // If the user cancels opening location settings, show an error message
        _showErrorDialog("Location services are required for this app.");
      }
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // If location permission is denied, request it from the user
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // If the user denies location permission, show an error message
        _showErrorDialog("Location permission is required for this app.");
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


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
      onPressed: ()async{

final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
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
              Color.fromARGB(255, 248, 248, 249),
              Color.fromARGB(255, 31, 2, 145),
            ])),
        child: SingleChildScrollView(
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
                onTap: ()async{
                  List<Map<String,dynamic>>?data=await getRepportApi(logId);
                  navigation:Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reports(repports: data,),));
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
      ),
    );
  }
}
