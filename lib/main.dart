import 'package:flutter/material.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(), // Change to LoginScreen instead of FutureBuilder
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter IP Address'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _ipController,
                decoration: InputDecoration(
                  labelText: 'IP Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _submitIP(context,_ipController.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitIP(BuildContext context, String ips) async {
    // Perform login check here with the submitted IP address
    final String ipAddress = _ipController.text;
    // final bool isLoggedIn = logId!=''?true:false;
    ip = ips;
    print(ip);
    if (logId!='') {
      ip = ips;
      // Save IP address to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('ipAddress', ipAddress);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => BottomnavScreen()),
      );
    } else {
      ip = ips;
       Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Login()),);
    }
  }
}
