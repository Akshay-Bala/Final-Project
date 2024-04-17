import 'package:flutter/material.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/forgotpasswordApi.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  TextEditingController emailcont=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
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
                controller: emailcont,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid email';
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
                  onPressed: () async{
                    if(_formkey.currentState!.validate()){
await   forgotPass(emailcont.text,context);
                    }
                
                  },
                  child: Text("Send email"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 31, 2, 145),
                    foregroundColor: Color.fromARGB(255, 252, 253, 253),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
