 import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potholedetect/UpdateProfileScreen.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/userhome.dart';

class Editprofile extends StatelessWidget {
Editprofile({Key? key}) : super(key: key);
  
//  // String profile;
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _pickedImagePath = pickedFile.path;
  //     setState(() {
  //       _pickedImagePath = pickedFile.path;
  //     });
    }
  }

  String? _pickedImagePath;

  @override
  Widget build(BuildContext context) {
   // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 79, 79),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        title: Text('EDIT PROFILE', style: Theme.of(context).textTheme.headline4),
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
                        child: const Image(image: NetworkImage('https://media.licdn.com/dms/image/D5603AQEZtRGBNma4wQ/profile-displayphoto-shrink_800_800/0/1675238756602?e=2147483647&v=beta&t=h1vyv_RxFn3rvfXQvg_j_58Iu5V6yBMcpaY8BFWgXgg'))
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
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black),
                        child: const Icon(Icons.camera, color: Colors.brown, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if (value.toString().isEmpty){
                          return 'invalid';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("First Name"), prefixIcon: Icon(Icons.person)),
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty){
                          return 'invalid';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("Last name"), prefixIcon: Icon(Icons.person)),
                    ),
                     SizedBox(height: 20),
                     TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Gender"),prefixIcon: Icon(Icons.person)),
                    ),
                     SizedBox(height: 20),
                     TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Date of Birth"),prefixIcon: Icon(Icons.calendar_month)),
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text('PhoneNo'), prefixIcon: Icon(Icons.phone)),
                    ),
                     SizedBox(height: 20),
                     TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Adhaar No"),prefixIcon: Icon(Icons.document_scanner_outlined)),
                    ),
                     SizedBox(height: 20),
                     

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomnavScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 47, 79, 79),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Save', style: TextStyle(color: Colors.black)),
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