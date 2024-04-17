import 'package:flutter/material.dart';
import 'package:potholedetect/editprofile.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:potholedetect/utils/api/profileapi.dart';


List<Map<String,dynamic>>? profileDatas=[];
class UpdateProfileScreen extends StatefulWidget {
 UpdateProfileScreen({Key? key}) : super(key: key);


  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  @override
  
  void initState() {
   getdata();
   
    super.initState();
  }

  void getdata()async{
 profileDatas= await profileApi(logId);
 setState(() {
   
 });
 print(profileDatas);
  }


  @override
  Widget build(BuildContext context) {

     //controllers


   // final controller = Get.put(ProfileController());
if (profileDatas!.length==0) {
  return Scaffold(body: Center(child: CircularProgressIndicator(),),);
}
TextEditingController firstnameController = TextEditingController(text: profileDatas![0]["First_name"]+' '+ profileDatas![0]["Last_name"]);
TextEditingController lastnameController = TextEditingController(text: profileDatas![0]["Last_name"]??'');
final TextEditingController genderController = TextEditingController(text: profileDatas![0]["Gender"]??'');
final TextEditingController dobController = TextEditingController(text: profileDatas![0]["Dob"].toString().substring(0,17)??'');
final TextEditingController addresscontroller = TextEditingController(text: profileDatas![0]["Address"]??'');
final TextEditingController PhoneController = TextEditingController(text: profileDatas![0]["Phone_number"].toString()??'');
final TextEditingController adarController = TextEditingController(text: profileDatas![0]["Adhaar_no"].toString()??'');
final TextEditingController emailController = TextEditingController(text: profileDatas![0]["Email"]??'');
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 2, 145),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.verified_rounded,color: Colors.white,)),
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
                        child: Image.network('$baseurl/static/images/${ profileDatas![0]["Photo"]}') 
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
                     controller: firstnameController,
                      readOnly: true,
                      decoration:  InputDecoration(
                          label: Text("Name"), prefixIcon: Icon(Icons.person)),
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                      controller:emailController,
                      readOnly: true,
                      validator: (value) {
                        if (value.toString().isEmpty){
                          return 'invalid';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("email"), prefixIcon: Icon(Icons.person)),
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                     controller: addresscontroller,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Address"), prefixIcon: Icon(Icons.house)),
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
                      controller:dobController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Date of Birth"),prefixIcon: Icon(Icons.calendar_month)),
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                      controller: PhoneController,
                      readOnly: true,
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
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile(profiledatas: profileDatas,)));
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
                            text: ' ',
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '  ',
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

