import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_project/screens/userlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  hintText: 'Enter Email',
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
                      .createUserWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    print("User registered succesfully");
                    FirebaseFirestore.instance
                        .collection('UserData')
                        // .doc(value.user?.uid)
                        .add({'name': 'data added through app'})
                        // .set({"email": value.user?.email})
                    ;
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => UserLogin()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
