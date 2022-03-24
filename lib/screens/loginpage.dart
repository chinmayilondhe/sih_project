import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_project/screens/userlogin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              ClipRRect(child: Image.asset("images/SIH-01.png",height: MediaQuery.of(context).size.height,)),

              Positioned(
                  top: 400,
                  left: 120,
                  child: Column(
                    children: [
                      Text("Log In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                      SizedBox(height: 70,),
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
                                        .withOpacity(0.4)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Admin",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (c) => UserLogin()));
                              },
                              child: const Text("User",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),

                       ],
                  )),

            ]),

          ],
        ),
      ),
    );
  }
}
