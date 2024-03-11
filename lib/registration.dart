import 'package:potholedetect/custom_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/login.dart';

class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
 
 //Form passing
 
  var formkey = GlobalKey<FormState>();

  ValueNotifier<bool> visibility1=ValueNotifier<bool>(true);

  ValueNotifier<bool> visibility2=ValueNotifier<bool>(true);

  //Controllers

  final TextEditingController fistnameController = TextEditingController();

  final TextEditingController lastnameController = TextEditingController();

  final TextEditingController PhoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController cpassController = TextEditingController();

  final TextEditingController adarController = TextEditingController();

  Color bC = Colors.black26;

  String selectedValue = 'Male';
  String selectedDob = 'Select DOB';
  bool isDobSelected = false;

  final dropdownItem = [
    'Male','Female','Other'
  ];

  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      
        appBar: AppBar(
          title: Text("REGISTRATION FORM"),
          centerTitle: true, // title on the centre
          backgroundColor:
              const Color.fromARGB(255,47,79,79), //appbar color
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
Row(children: [Container(width: mediaquery.width/2-23,
                  child: customtextfield(
                    controller: fistnameController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'invalid';
                      }
                      return null;
                    },
                    label: "First name",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(width: mediaquery.width/2-25,
                  child: customtextfield(
                    controller: lastnameController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'invalid';
                      }
                      return null;
                    },
                    label: "Last name",
                  ),
                ),
                

],),
SizedBox(
                  height: 5,
                ),

                Text("Select Gender"),
                SizedBox(
                  height: 3,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropdownButton(
                   // padding: EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(10),
                    value: selectedValue,
                    items: dropdownItem.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                    onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  }),
                ),
SizedBox(
                  height: 5,
                ),

                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      initialDate: DateTime.now(),
                      //selectableDayPredicate: (day) {print(day); return true;},
                      context: context, firstDate: DateTime(1960), lastDate: DateTime.now());
                      List<String> parts = date.toString().split(' ');

                    selectedDob = parts[0].toString();
                    print(selectedDob
                    );
                    isDobSelected = true;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: bC
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Text("DOB : $selectedDob" ),
                  ),
                ),

                SizedBox(height: 5),
                
                customtextfield(
                  controller: PhoneController,
                  validator: (value)
                   {
                  if (value.toString().isEmpty) {
                    return 'invalid';
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                    return 'incorrect';
                }
                else if(value.length <10 || value.length >10){
                  return 'invalid phone number';
                }
                  return null;
              },
                label: "Phone number", 
              ),

                SizedBox(
                  height: 5,
                ),
                customtextfield(
                  controller: emailController,
                   validator: (value) {
                    if (value.toString().isEmpty) {
                       return 'invalid';
                     } else if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]+$').hasMatch(value.toString())) {
                       return 'incorrect';
                   }
                    return null;
                  },
                   label: "E-mail",
                   ),
                SizedBox(
                  height: 5,
                ),
                customtextfield(
                  controller: adarController,
                  validator: (value)
                   {
                  if (value.toString().isEmpty) {
                    return 'invalid';
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                    return 'incorrect';
                }
                else if(value.length <16 || value.length >16){
                  return 'invalid adhaar number';
                }
                  return null;
              },
                label: "Adhaar Number", 
              ),

                SizedBox(
                  height: 5,
                ),
ValueListenableBuilder(valueListenable: visibility1, builder: (context, value, child) {
                  return  customtextfield(
                    controller: passController,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'invalid';
                    }
                    else if (value.length <8) {
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
                      icon:visibility1.value? Icon(Icons.visibility_off): Icon(Icons.visibility)),
                );
              },),
               SizedBox(
                height: 5 
                 ),
      ValueListenableBuilder(valueListenable: visibility2, builder: (context, value, child) {
             return  customtextfield(
              controller: cpassController,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'invalid';
                    }
                    else if(value.length <8)
                    {
                      return 'Length should be 8-16 characters';
                    }
                    else if(passController.text != cpassController.text)
                    {
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
                      icon:visibility2.value? Icon(Icons.visibility_off): Icon(Icons.visibility)),
                );
},),

               
                Align(),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {

                          if (formkey.currentState!.validate() && isDobSelected == true) {
                            print("jgfv");
                          }
                          else if(isDobSelected == false){
                            bC = Colors.red;
                            setState(() {
                              
                            });
                          }
                          else if(isDobSelected= true){
                           bC = Colors.black38;
                            setState(() {
                              
                            });
                          }

                        },
                        child: Text("Register"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 54, 244, 143),
                            foregroundColor:
                                Color.fromARGB(255, 237, 237, 237)))),
                TextButton(onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));
                }, child: Text('Already have an account??Login'))
              ],
            ),
          ),
        ));
  }
}
