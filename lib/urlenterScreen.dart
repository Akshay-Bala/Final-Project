import 'package:flutter/material.dart';
import 'package:potholedetect/utils/api/loginapi.dart';

class UrlEnterScreen extends StatelessWidget {
  UrlEnterScreen({super.key});

  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Enter base url"),
          SizedBox(height: 20,),
          TextFormField(
            controller: urlController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
              ip = urlController.text;  
              print(ip);
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}