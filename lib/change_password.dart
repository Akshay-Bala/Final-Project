import 'package:flutter/material.dart';
import 'package:potholedetect/UpdateProfileScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/changePasswordApi.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/api/profileapi.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassController=TextEditingController();

  TextEditingController newPassController=TextEditingController();

  bool isObsecure1 = true;
   bool isObsecure2 = true;

  @override
  Widget build(BuildContext context) {
    var _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password",style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                
                obscureText:isObsecure2,
                controller: oldPassController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isObsecure2? isObsecure2 = false: isObsecure2 = true;
                    });
                  }, icon: isObsecure2? Icon(Icons.visibility):Icon(Icons.visibility_off)),
                  labelText: "Current Password",
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  else if(value.length < 8) {
                            return 'Length should be minimum 8 characters';
                          }
                  // Add any additional validation logic here
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                
                obscureText:isObsecure1,
                controller: newPassController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isObsecure1? isObsecure1 = false: isObsecure1 = true;
                    });
                    
                  }, icon: isObsecure1? Icon(Icons.visibility):Icon(Icons.visibility_off)),
                  labelText: "New Password",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  else if(value.length < 8) {
                            return 'Length should be minimum 8 characters';
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
                  onPressed: ()async {
                    print(profileDatas);
                    //profileApi("2");
                    // Implement your logic for changing the password
                    // You can navigate back to the login page after changing the password
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    if (_formkey.currentState!.validate()) {
                       await   changePassword(logId,oldPassController.text,newPassController.text,context);
                 oldPassController.clear();
                 newPassController.clear();
                    }
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
      ),
    );
  }
}
