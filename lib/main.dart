import 'package:flutter/material.dart';
import 'package:potholedetect/bottomNavScreen.dart';
import 'package:potholedetect/login.dart';
import 'package:potholedetect/utils/api/loginapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Widget> _initialScreen;

  @override
  void initState() {
    super.initState();
    _initialScreen = check();
  }

  Future<Widget> check() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    logId = prefs.getString('lid') ?? '';
    if (logId.isNotEmpty) {
      return BottomnavScreen();
    } else {
      return Login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<Widget>(
        future: _initialScreen,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator or splash screen while checking
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              // Handle error or fallback to default screen
              return Login();
            }
          }
        },
      ),
    );
  }
}