import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/common/snackbar.dart';


  Dio dio = Dio();

 Future<void> changePassword(lid,oldpass,newpass,context) async {
  final String apiUrl = '$baseurl/changepassword?loginid=$lid&oldpassword=$oldpass&newpassword=$newpass';

  try {
   

   

    Response response = await Dio().post(apiUrl,);

    print(response.statusCode);
    if (response.statusCode==200) {
      if (response.data['task']!='Invalid') {
        showCustomSnackBar(context, 'Password Changed Successfully', Colors.green);
      }else{
         showCustomSnackBar(context, 'Failed to Change', Colors.red);
      }
    
   
      
    }
    else{
      print('Sending failed');
    }
    print(response);
    
  } catch (e) {
    print(e);
  
  }
}