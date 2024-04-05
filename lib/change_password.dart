import 'package:flutter/material.dart';
import 'package:potholedetect/login.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password",style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Current Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your current password';
                }
                // Add any additional validation logic here
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your new password';
                }
                // Add any additional validation logic here
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Confirm New Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your new password';
                }
                // Add any additional validation logic here
                return null;
              },
            ),
            SizedBox(height: 20),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Implement your logic for changing the password
                  // You can navigate back to the login page after changing the password
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
                child: Text("Change Password"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 31, 2, 145),
                  foregroundColor: Color.fromARGB(255, 252, 253, 253),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
