import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({super.key, this.repports});
  final repports;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Current Reports',style: TextStyle(color: Colors.white),),
            Icon(Icons.report),
            
          ],
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 248, 249, 249)),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),

      
    );
  }
}