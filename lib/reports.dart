import 'package:flutter/material.dart';
import 'package:potholedetect/UpdateProfileScreen.dart';
import 'package:potholedetect/mapview.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:url_launcher/url_launcher.dart';

class Reports extends StatelessWidget {
  const Reports({super.key, this.repports});
  final repports;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Current Reports',
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.report),
          ],
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 248, 249, 249)),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(repports[index]['Complaint_type']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(repports[index]['Description']),
                Text('Replay:'),
                Text(repports[index]['Reply']==''?'pending':repports[index]['Reply'])
              ],
            ),
            trailing: IconButton(onPressed: (){
              print('sssss'+repports[index]['Latitude'].toString());
              print(repports[index]['Longitude'].toString());
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Mapview(latitude:repports[index]['Latitude'] ,longitude: repports[index]['Longitude'] ,)));

// _launchMaps(repports[index]['latitude'], repports[index]['longitude']);
            }, icon: Icon(Icons.location_on_outlined)),
            leading: Image.network('$baseurl/static/images/${repports[index]['Photo']}'),
          ));
        },itemCount: repports.length,
      ),
    );
  }
 



}