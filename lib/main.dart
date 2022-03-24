import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih_project/screens/loginpage.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/image1.jpg"),
          Text(
            '\nCare App',
            style: TextStyle(
              color: Color.fromRGBO(39, 105, 171, 1),
              fontSize: MediaQuery.of(context).size.width / 12,
              decoration: TextDecoration.none,
              fontFamily: 'Nunito',
            ),
          ),
          Text(
            '\n\n\n\n\n\n\nTech Savy Youth',
            style: TextStyle(
              color: Color.fromRGBO(39, 105, 171, 1),
              fontSize: MediaQuery.of(context).size.width / 20,
              decoration: TextDecoration.none,
              fontFamily: 'Nunito',
            ),
          ),
        ],
      ),
    );
  }
}
