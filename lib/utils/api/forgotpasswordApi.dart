import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:potholedetect/login.dart';
import 'package:potholedetect/otpScreen.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/common/snackbar.dart';



Future<void> forgotPass(String email,context) async {
  
  final url = Uri.parse("$baseurl/forgot_password?email=$email");
  try {
    final response = await http.post(url);
    print(response.body);
    print('object');
    if (response.statusCode >= 200 && response.statusCode < 300) {
     
      // Check if the decoded data is a list
      print(response.body);
      
      Map data=jsonDecode(response.body);
       print(data['message']);
      if (data['message']=='Success.') {
       
        showCustomSnackBar(context, 'Email send to $email', Colors.green);
        Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(email: email,),));
      }
      else{
        showCustomSnackBar(context, 'incorrect email', Colors.red);
      }
    
    } else {
      print(response.statusCode);
      print("API call error");
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  } 
}



// send otp and passs
Future<void> sendOtpAndPass(String email,pass,otp,context) async {
  
  final url = Uri.parse("$baseurl/checkotp?email=$email&password=$pass&otp=$otp");
  try {
    final response = await http.post(url);
    print(response.body);
    print('object');
    if (response.statusCode >= 200 && response.statusCode < 300) {
     
      // Check if the decoded data is a list
      print(response.body);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
     
    
    } else {
      print(response.statusCode);
      print("API call error");
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  } 
}

