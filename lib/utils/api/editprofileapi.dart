import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/UpdateProfileScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/common/snackbar.dart';


  Dio dio = Dio();

 Future<void> registerUser(Map<String, dynamic> data,  image,context) async {
  print("img: ${image}");
  final String apiUrl = '$baseurl/edit_registration';

  try {
    FormData formData = FormData();

    // Add fields from the data map
    data.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    // Add the image file
    formData.files.add(MapEntry(
        'Photo',
        await MultipartFile.fromFile(
          image,
          // filename: 'img.jpg',
        )));

    Response response = await Dio().post(apiUrl, data: formData);

    print(response.statusCode);
    if (response.statusCode==200) {
      if (response.data['task']=='success') {
        showCustomSnackBar(context, 'Profile Updated', Colors.green);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
       
      }
      
    }
    else{
      print('register failed');
    }
    print(response);
    
  } catch (e) {
    print("exception");
    print(e);
  
  }
}