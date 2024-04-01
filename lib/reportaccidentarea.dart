import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/main.dart';


class Reportaccidentarea extends StatefulWidget {
  Reportaccidentarea({Key? key}) : super(key: key);

  @override
  _ReportpotholeState createState() => _ReportpotholeState();
}

class _ReportpotholeState extends State<Reportaccidentarea> {
  XFile? selectedImage;
  bool _showError = false;
  Position? position;


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  print(" here here");
  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    //permission = await Geolocator.requestPermission();
    return Future.error('Location services are disabled.');
  }
  else{
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
    //permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
    else{
      return Future.error('Location permissions are enabled');
    }
  //   if (permission == LocationPermission.deniedForever) { 
  //   return Future.error(
  //     'Location permissions are permanently denied, we cannot request permissions.');
  // }    
  }
}

  Future<void> _getImage() async {
    position=await _determinePosition();
    if (position != 'Location permissions are enabled') {
      await Geolocator.openLocationSettings();
    }
    print("object: $position");
   // final ImagePicker picker = ImagePicker();
   
  //  print(position);
  //   final XFile? photo = await picker.pickImage(source: ImageSource.camera);


  //   if (photo != null) {
  //     setState(() {
  //       selectedImage = photo;
  //     });
  //   } else {
  //     print("failed");
  //   }
  }

  final TextEditingController Descriptioncontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaquery =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report Accident area',
          style: TextStyle(color: Color.fromARGB(255, 248, 249, 249)),
        ),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedImage != null)
                 
                SizedBox(height: 20),
               
                Center(
                    child: InkWell(
                      onTap: ()async{
                        _determinePosition();
                        //await _getImage();
                      },
                      child:selectedImage==null ?Container(
                                        height: mediaquery.height *.20,
                                        width: mediaquery.width *.90,
                                        child: Center(
                      child: Icon(
                        Icons.add_a_photo_sharp,
                        size: 50,
                      ),
                                        ),
                                      ):Image.file(File(selectedImage!.path)),
                    )),
                    selectedImage!=null?Text('Tap on image to retake'):Text(''),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: Descriptioncontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _showError = true;
                              });
                              return null;
                            }
                            setState(() {
                              _showError = false;
                            });
                            return null;
                          },
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Enter your complaint here . . .',
                          ),
                          maxLines: null,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_showError)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Fill the field',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomnavScreen()));
                      if (formkey.currentState!.validate() && selectedImage!=null ) {
                        print('bhiakddj');
                      } else {
                        showCustomSnackBar(context, "Fill all the fields");
                      }
                    },
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 2, 145),
                      elevation: 0,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      side: BorderSide.none,
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
