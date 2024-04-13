import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/common/snackbar.dart';


  Dio dio = Dio();

 Future<void> reportAccidentApi(Map<String, dynamic> data,  image,context) async {
  final String apiUrl = '$baseurl/user_accident_zone';

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
          image.path,
          // filename: 'img.jpg',
        )));

    Response response = await Dio().post(apiUrl, data: formData);

    print(response.statusCode);
    if (response.statusCode==200) {
    showCustomSnackBar(context, 'Report Send Successfully', Colors.green);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomnavScreen()));
      
    }
    else{
      print('sending failed');
    }
    print(response);
    
  } catch (e) {
    print(e);
  
  }
}