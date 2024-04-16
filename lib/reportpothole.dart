import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/custom_widgets/textfield.dart';
import 'package:potholedetect/main.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/api/reportpotholeapi.dart';
import 'package:potholedetect/utils/common/snackbar.dart';


class Reportpothole extends StatefulWidget {
  Reportpothole({Key? key}) : super(key: key);

  @override
  _ReportpotholeState createState() => _ReportpotholeState();
}

class _ReportpotholeState extends State<Reportpothole> {
  XFile? selectedImage;
  bool _showError = false;
  Position? position;
  final TextEditingController areaController = TextEditingController();


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  await Permission.location.request();

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showCustomSnackBar(context, 'Location permissions are denied', Colors.red);
      openAppSettings();
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();
   position= await _determinePosition();
   print(position);
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);


    if (photo != null) {
      setState(() {
        selectedImage = photo;
      });
    } else {
      print("failed");
    }
  }

  final TextEditingController descriptioncontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaquery =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report pothole',
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
                        await _getImage();
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
                    SizedBox(height: 20,),
                    customtextfield(
                  controller: areaController,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter the pothole area';
                    }
                    return null;
                  },
                  label: "Area",
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 200,
                  child: Column(
                    
                    children: [
                      
                SizedBox(height: 5),
                      Expanded(
                        child: TextFormField(
                          controller: descriptioncontroller,
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
                    onPressed: ()async {
                      
                      if (formkey.currentState!.validate() && selectedImage!=null ) {
                        print('bhiakddj');

                        Map<String,dynamic>data={

'logid': logId ,
'description': descriptioncontroller.text ,
'lattitude':  position!.latitude,
'longitude':  position!.longitude,
'area':  areaController.text,

                        };
reportPotholeapi(data,selectedImage,context);

                      } else {
                        showCustomSnackBar(context, "Fill all the fields",Colors.red);
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
