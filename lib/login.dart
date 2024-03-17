import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/custom_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/forgetpassword.dart';
import 'package:potholedetect/registration.dart';
import 'package:potholedetect/userhome.dart';

class Login extends StatelessWidget {
  Login({super.key});
  var formkey = GlobalKey<FormState>();
  bool visubiliity = true;
  ValueNotifier<bool> visibility=ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" "),
          foregroundColor: Color.fromARGB(255, 246, 246, 248),
          centerTitle: true, // title on the centre
          backgroundColor:
              Color.fromARGB(255, 31, 2, 145), //appbar color
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Container(
              // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://gabrielsales.com/wp-content/uploads/form-bg.jpg',),fit: BoxFit.cover)),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.contain)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customtextfield(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Empty username';
                      }
                      return null;
                    },
                    label: "Username",
                    
                  ),
                  SizedBox(
                    height: 5,
                  ),
              ValueListenableBuilder(valueListenable: visibility, builder: (context, value, child) {
                return  customtextfield(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Empty password';
                      }
                      return null;
                    },
                    obscureText: visibility.value,
                    label: "Password",
                    suffix: IconButton(
                        onPressed: () {
                          visibility.value = !visibility.value;
                          print(visibility.value);
                        },
                        icon:visibility.value? Icon(Icons.visibility_off): Icon(Icons.visibility)),
                  );
              },),
              
                 
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                          }, child: Text('Forgot password..?'))),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomnavScreen()));
                            if (formkey.currentState!.validate()) {
                              print("jgfv");
                            }
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 31, 2, 145),
                              foregroundColor:
                                  Color.fromARGB(255, 252, 253, 253)))),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                  }, child: Text('New register..??'))
                ],
              ),
            ),
          ),
        ));
  }
}
