import 'package:flutter/material.dart';
import 'package:potholedetect/editprofile.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.verified_user)),
        title: Text('PROFILE', style: TextStyle(color: Color.fromARGB(255, 248, 249, 249))),
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
                        child: const Image(image: AssetImage('assets/images/bg.jpg'))),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black),
                  //     child: const Icon(Icons.camera, color: Colors.brown, size: 20),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("First Name"), prefixIcon: Icon(Icons.person)),
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 31, 2, 145),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Edit', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // -- Created Date and Clear Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: 'Date',
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '  JoinedAt',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                            ],
                          ),
                        ),
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