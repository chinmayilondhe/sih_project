import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_project/screens/homepage.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(

        decoration: BoxDecoration(
          color: Colors.lightBlue.shade100
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide( width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'User ID',
                ),
              ),
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide( width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (c)=>Home()));
            }, child: Text("Login"))
        ],),
      ),
    );
  }
}
