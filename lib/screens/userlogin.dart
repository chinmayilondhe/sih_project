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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    child: Image.asset("images/SIH2-01.png", height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    )),
                Positioned(
                  top: 150, left: 50,
                  child: Column(
                    children: [
                      Text("WELCOME", style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 230,),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(
                                    width: 2, color: Colors.cyanAccent),
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
                                borderSide:
                                const BorderSide(
                                    width: 2, color: Colors.cyanAccent),
                                borderRadius: BorderRadius.circular(30)),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(26)),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(7),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.cyanAccent.shade700
                                        .withOpacity(0.6)),
                              ),
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (c) => Home()));
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
                              child: const Text("Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),

                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (c) => SignUp()));
                          },
                          child: Text("Sign Up")),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
