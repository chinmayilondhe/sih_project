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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LOGIN",style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){

              }, child: Text("Admin")),
              ElevatedButton(onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (c)=>UserLogin()));
              }, child: Text("user")),

            ],
          ),
        ),
      ),
    );
  }
}
