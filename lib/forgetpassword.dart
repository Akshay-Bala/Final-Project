import 'package:flutter/material.dart';
import 'package:potholedetect/login.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forgot Your Password?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter your email address below to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more email validation logic here if needed
                return null;
              },
            ),
            SizedBox(height: 20),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  // Implement your logic for sending password reset email
                  // You can add a Snackbar to notify the user that the reset email has been sent
                },
                child: Text("Send Password"),
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
