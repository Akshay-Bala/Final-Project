import 'package:flutter/material.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/api/viewNotifiApi.dart';
import 'package:potholedetect/widgets/devicecard.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String ,dynamic>>notifications=[];

  @override
  void initState() {
    getdata();
    super.initState();
  }

  void getdata()async{
   notifications!= await getNotificationsApi(logId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('About us',style: TextStyle(color: Colors.white),),
            Icon(Icons.messenger_outline),
            
          ],
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 248, 249, 249)),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
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
                      children:[Text(' hjbjhkj hijilko jhjjkl jnjknkb kjhkjkljkl kjjkjklj hjbjj'),
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