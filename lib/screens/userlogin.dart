import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_project/screens/alert.dart';
import 'package:sih_project/screens/signUp.dart';
import 'package:sih_project/screens/homepage.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.lightBlue.shade100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'User ID',
                ),
              ),
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text.trim(),
                          password: _password.text.trim())
                      .then((value) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Home()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    // Alert(); //error
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => Alert()));
                  });
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => SignUp()));
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
