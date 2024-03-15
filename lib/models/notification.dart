import 'package:flutter/material.dart';
import 'package:potholedetect/widgets/devicecard.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Notifications'),
            Icon(Icons.notifications),
            
          ],
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Color.fromARGB(255, 47, 79, 79),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: ListView.separated(
            itemBuilder:(context, index) {
              return Container(child:
               Column(
                children: [
                  SizedBox(height: 5,),
                  Row(
                  children: [Icon(Icons.notifications),
                  SizedBox(width: 25,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[Text('--------- hjbjhkj hijilko jhjjkl jnjknkb kjhkjkljkl kjjkjklj hjbjj'),
                      SizedBox(height: 5,),
                      Text("15-03-2024  7:56 AM"),
                      SizedBox(height: 5,)
                      ],
                    ),
                  )],
                )
                ],
              ),);
            }, 
            itemCount: 10,
            separatorBuilder:(context, index) =>  Divider(),


        )),)
    );
  }
}