import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
   AboutUsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'About us',
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.messenger_outline),
          ],
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 248, 249, 249)),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Report a Pothole",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Send a picture with your location and place of a pothole you have encountered",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Users can snap a picture of the pothole using their smartphone camera directly within the app. This picture serves as visual evidence, aiding authorities in assessing the severity of the issue. Please keep in mind that if the pothole you're about to report is within our scope, we will do our best to get to it as quickly as possible. Thanks in advance for your patience.",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    "Report an Accident Prone Area",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Send a picture with your location and place of an accident area",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Users can snap a picture of the zone area using their smartphone camera directly within the app. This picture serves as visual evidence, aiding authorities in assessing the severity of the issue. Please keep in mind that if the accident you're about to report is within our scope, we will do our best to get to it as quickly as possible. Thanks in advance for your patience.",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}