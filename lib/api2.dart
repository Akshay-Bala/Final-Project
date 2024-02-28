import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/models/usersmod.dart';
import 'package:potholedetect/models/usersmod.dart';
List<Users> users=[];

final dio = Dio();

Future getHttp() async {
  try{
      final response = await dio.get('https://fakestoreapi.com/users');
  print(response);

  if(response.statusCode == 200){
    List<dynamic> responseData = response.data;
    users = responseData.map((e) => Users.fromJson(e)).toList();
    print('success');
  }

  }catch(e){
    print('error $e');

  }

}

class api2 extends StatefulWidget {
  const api2({super.key});

  @override
  State<api2> createState() => _api2State();
}

class _api2State extends State<api2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: ()async{
            print('');
            await getHttp();
            print(users.length);
            setState(() {
              
            });
          }, child: Text('get data')),
          Expanded(child: ListView.builder(itemBuilder:(context, index) {
            return Text(users[index].email.toString());
          },
          itemCount: users.length ,),)
        ],
      ),
    );
  }
}