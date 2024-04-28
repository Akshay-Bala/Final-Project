import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:potholedetect/custom_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/registerApi.dart';
import 'package:potholedetect/utils/common/snackbar.dart';

class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //Form passing

  File _image = File('Profile photo');

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    // print(_image!.path??'null');
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  var formkey = GlobalKey<FormState>();

  ValueNotifier<bool> visibility1 = ValueNotifier<bool>(true);

  ValueNotifier<bool> visibility2 = ValueNotifier<bool>(true);

  //Controllers

  final TextEditingController fistnameController = TextEditingController();

  final TextEditingController lastnameController = TextEditingController();

  final TextEditingController PhoneController = TextEditingController();

  final TextEditingController addresscontroller = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController cpassController = TextEditingController();

  final TextEditingController adarController = TextEditingController();

  Color bC = Colors.black26;
  String isGenderselected = "";

  String selectedValue = '';
  String selectedDob = 'Select DOB';
  bool isDobSelected = false;
  Color c = Colors.black;

  final dropdownItem = ["", 'Male', 'Female', 'Other'];
  bool containsOnlyLetters(String name) {
  // Regular expression pattern to match only alphabetic characters
  RegExp regex = RegExp(r'^[a-zA-Z ]+$');
  return regex.hasMatch(name);
}

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("REGISTRATION FORM"),
          centerTitle: true, // title on the centre
          backgroundColor: const Color.fromARGB(255, 31, 2, 145),
          foregroundColor: Color.fromARGB(255, 248, 249, 250), //appbar color
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: mediaquery.width / 2 - 23,
                      child: customtextfield(
                        
                        controller: fistnameController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter your first name';
                          }
                         else if(containsOnlyLetters(value.toString()) == false){
                          return "Enter Characters";
                         }  
                          return null;
                        },
                        label: "First name",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: mediaquery.width / 2 - 25,
                      child: customtextfield(
                        controller: lastnameController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter your last name';
                          }
                          else if(containsOnlyLetters(value.toString()) == false){
                          return "Enter Characters";
                         }  
                          return null;
                        },
                        label: "Last name",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Select Gender"),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: c),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                    child: DropdownButton(
                        isExpanded: true,
                        //underline: ,
                        //padding: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(10),
                        value: selectedValue,
                        items: dropdownItem
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            isGenderselected = value!;
                            selectedValue = value!;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      
                        initialDate: DateTime.now(),
                        //selectableDayPredicate: (day) {print(day); return true;},
                        context: context,
                        firstDate: DateTime(1960),
                        lastDate: DateTime.now());
                    List<String> parts = date.toString().split(' ');

                    selectedDob = parts[0].toString();
                    print(selectedDob);
                    isDobSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "DOB",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ":",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(" $selectedDob")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                customtextfield(
                  controller: addresscontroller,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter your address';
                    }
                    else if(containsOnlyLetters(value.toString()) == false){
                          return "Enter Characters";
                         }  
                    return null;
                  },
                  label: "Address",
                ),
                SizedBox(height: 20),
                customtextfield(
                  controller: PhoneController,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter your phone number';
                    } else if (!RegExp(r'^[0-9]+$')
                        .hasMatch(value.toString())) {
                      return 'Enter digits';
                    } else if (value.length < 10 || value.length > 10) {
                      return 'invalid phone number';
                    }
                    return null;
                  },
                  label: "Phone number",
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 47, 1, 146)),
                      borderRadius: BorderRadius.circular(9)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_image.path.split('/').last),
                        Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  _openImagePicker();
                                },
                                child: Text("Choose file"))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                customtextfield(
                  controller: emailController,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter your e-mail id';
                    } else if (!RegExp(
                            r'^[a-z][a-zA-Z0-9+_.-]+@gmail.com')
                        .hasMatch(value.toString())) {
                      return 'incorrect';
                    }
                    return null;
                  },
                  label: "E-mail",
                ),
                SizedBox(
                  height: 20,
                ),
                customtextfield(
                  controller: adarController,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter your adhaar number';
                    } else if (!RegExp(r'^[0-9]+$')
                        .hasMatch(value.toString())) {
                      return 'incorrect';
                    } else if (value.length < 12 || value.length > 12) {
                      return 'invalid adhaar number';
                    }
                    return null;
                  },
                  label: "Adhaar Number",
                ),
                SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                  valueListenable: visibility1,
                  builder: (context, value, child) {
                    return customtextfield(
                      controller: passController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter your password';
                        } else if (value.length < 8) {
                          return 'Length should be minimum 8 characters';
                        }
                        return null;
                      },
                      obscureText: visibility1.value,
                      label: "Password",
                      suffix: IconButton(
                          onPressed: () {
                            visibility1.value = !visibility1.value;
                            print(visibility1.value);
                          },
                          icon: visibility1.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    );
                  },
                ),
                SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: visibility2,
                  builder: (context, value, child) {
                    return customtextfield(
                      controller: cpassController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter your password again to confirm';
                        } else if (value.length < 8) {
                          return 'Length should be 8-16 characters';
                        } else if (passController.text !=
                            cpassController.text) {
                          return 'Password not matches';
                        }
                        return null;
                      },
                      obscureText: visibility2.value,
                      label: "Confirm Password",
                      suffix: IconButton(
                          onPressed: () {
                            visibility2.value = !visibility2.value;
                            print(visibility2.value);
                          },
                          icon: visibility2.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    );
                  },
                ),
                Align(),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () async{
                          setState(() {
                            isGenderselected == ""
                                ? c = Colors.red
                                : c = Colors.black;
                          });
                          print(selectedDob);
                          
                          if (formkey.currentState!.validate()
                              ) {
                            if (_image.path != 'Profile photo') {
                              if (selectedDob != 'Select DOB') {
                              // perform actuons  


Map<String,dynamic>data={
  'First_name': fistnameController.text ,
  'Last_name': lastnameController.text ,
  'Phone_number':PhoneController.text,
  'address':addresscontroller.text,
  'email':emailController.text,
  'password':passController.text,
  'Adhaar_no ':adarController.text,
  'Dob':selectedDob,
  'Gender':selectedValue,

};

                                print("jgfv");
 await registerUser(data,_image,context);

                              } else {
                                bC = Colors.red;
                            setState(() {});
                                showCustomSnackBar(context,
                                    'Select Date of Birth', Colors.red);
                              }
                            } else {
                              showCustomSnackBar(
                                  context, 'Select Profile img', Colors.red);
                            }
                          } else if (isDobSelected == false) {
                            bC = Colors.red;
                            setState(() {});
                          } else if (isDobSelected = true) {
                            bC = Colors.black38;
                            setState(() {});
                          }
                        },
                        child: Text("Register"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 31, 2, 145),
                            foregroundColor:
                                Color.fromARGB(255, 237, 237, 237)))),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text('Already have an account??Login'))
              ],
            ),
          ),
        ));
  }
}
