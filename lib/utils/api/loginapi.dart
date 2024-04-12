
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/api.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/main.dart';
import 'package:potholedetect/utils/common/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

String logId='';


Dio dio = Dio();
String baseurl='http://192.168.1.48:5000';

  Future<void> loginUser(username,password,context) async {
    

    try {
      Response response = await dio.get(
        '$baseurl/logincheck?Username=$username&Password=$password',
        // data: {
        //   'username': username,
        //   'password': password,
        // },
      );

      // Handle the response, you can use response.data to extract data from it.
      print(response.data);
      print(response.statusCode);
      String status=response.data['task'];
      String type=response.data['type'];
       String lid=response.data['lid'].toString();

       // Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('lid',lid );
prefs.setString('type',type );

logId=   await prefs.getString('lid')!;
print('stored');


      if (status=='success') {

        if (type=='user') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomnavScreen()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
        }

       
        
      }else{
        showCustomSnackBar(context,'Login failed',Colors.red);
      }

    } catch (error) {
      print('Error: $error');
    }
  }