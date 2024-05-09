import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potholedetect/UpdateProfileScreen.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/userhome.dart';
import 'package:potholedetect/utils/api/editprofileapi.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Editprofile extends StatefulWidget {
  Editprofile({Key? key, this.profiledatas}) : super(key: key);
  final profiledatas;

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  var _formkey = GlobalKey<FormState>();
  final ValueNotifier<String?> _pickedImagePathNotifier = ValueNotifier(null);

  @override
  void dispose() {
    _pickedImagePathNotifier.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _pickedImagePathNotifier.value = pickedFile.path;
    }
  }

bool containsOnlyLetters(String name) {
 
  // Regular expression pattern to match only alphabetic characters
  RegExp regex = RegExp(r'^[a-zA-Z ]+$');
  return regex.hasMatch(name);

}


  @override
  Widget build(BuildContext context) {
    TextEditingController firstnameController = TextEditingController(text: widget.profiledatas![0]["First_name"]);
    TextEditingController lastnameController = TextEditingController(text: widget.profiledatas![0]["Last_name"]);
    final TextEditingController genderController = TextEditingController(text: widget.profiledatas![0]["Gender"]);
    final TextEditingController dobController = TextEditingController(text: widget.profiledatas![0]["Dob"].toString().substring(0,17));
    final TextEditingController addresscontroller = TextEditingController(text: widget.profiledatas![0]["Address"]);
    final TextEditingController PhoneController = TextEditingController(text: widget.profiledatas![0]["Phone_number"].toString());
    final TextEditingController adarController = TextEditingController(text: widget.profiledatas![0]["Adhaar_no"].toString());
    final TextEditingController emailController = TextEditingController(text: widget.profiledatas![0]["Email"]);

     

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
        foregroundColor: Color.fromARGB(255, 249, 250, 251),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        title: Text('EDIT PROFILE',style: TextStyle(color: Color.fromARGB(255, 248, 249, 249)),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: ValueListenableBuilder<String?>(
                        valueListenable: _pickedImagePathNotifier,
                        builder: (context, imagePath, _) {
                          if (imagePath != null) {
                            return Image.file(File(imagePath),fit: BoxFit.fill,);
                          } else {
                            return Image.network('${baseurl}/static/images/${widget.profiledatas![0]["Photo"]}',fit: BoxFit.fill);
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => _pickImage(ImageSource.gallery),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black),
                        child: const Icon(Icons.camera, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
        
              // -- Form Fields
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstnameController,
                      validator: (value){
                        if (value.toString().isEmpty || value == null){
                          return 'Enter valid';
                        }
                        else if(containsOnlyLetters(value.toString()) == false){
                          return "Enter Characters";
                         }  
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text("First Name"), prefixIcon: Icon(Icons.person)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: lastnameController,
                      validator: (value) {
                        if (value.toString().isEmpty){
                          return 'Enter sub name';
                        }
                        else if(containsOnlyLetters(value.toString()) == false){
                          return "Enter Characters";
                         }  
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("Last name"), prefixIcon: Icon(Icons.person)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      readOnly: true,
                      validator: (value) {
                        if (value.toString().isEmpty){
                          return '';
                        }
                         else if (!RegExp(
                            r'^[a-z][a-zA-Z0-9+_.-]+@gmail.com')
                        .hasMatch(value.toString())) {
                      return 'Enter valid id';
                    }
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("email"), prefixIcon: Icon(Icons.person)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: addresscontroller,
                      validator: (value){
                        if (value.toString().isEmpty){
                          return 'Enter the address';
                        }
                        else if(containsOnlyLetters(value.toString()) == false){
                          return "Enter Characters";
                         }  
                    return null;
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("Address"), prefixIcon: Icon(Icons.home)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: genderController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Gender"),prefixIcon: Icon(Icons.person)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: dobController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Date of Birth"),prefixIcon: Icon(Icons.calendar_month)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: PhoneController,
                      decoration: const InputDecoration(
                          label: Text('PhoneNo'), prefixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: adarController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Adhaar No"),prefixIcon: Icon(Icons.document_scanner_outlined)),
                    ),
                    SizedBox(height: 20),
        
                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                          print("dfx hi hi");
                          if (_formkey.currentState!.validate()) {
                            print("validaryugh");
                            Map<String,dynamic>data={
                            'loginid':logId,
                            'First_name': firstnameController.text ,
                            'Last_name': lastnameController.text ,
                            'Phone_number':PhoneController.text,
                            'address':addresscontroller.text,
                            'email':emailController.text,
                            'Adhaar_no ':adarController.text,
                            'Dob':dobController.text,
                            'Gender':genderController.text,
                            
                          };
        
                          await registerUser(data,_pickedImagePathNotifier.value??"/data/user/0/com.example.potholedetect/cache/f3331f68-1b9c-47bc-a8a1-ccb4d794550f/Screenshot_2024-05-09-10-59-03-386_com.google.android.apps.maps.jpg",context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 31, 2, 145),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Save', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),
        
                    // -- Created Date and Clear Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Text.rich(
                        //   TextSpan(
                        //     text: 'Date',
                        //     style: TextStyle(fontSize: 12),
                        //     children: [
                        //       TextSpan(
                        //           text: '  JoinedAt',
                        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                        //     ],
                        //   ),
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.redAccent.withOpacity(0.1),
                        //       elevation: 0,
                        //       foregroundColor: Colors.red,
                        //       shape: const StadiumBorder(),
                        //       side: BorderSide.none),
                        //   child: const Text('Clear'),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
