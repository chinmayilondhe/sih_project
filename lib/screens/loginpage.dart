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
        child: Container(

          // padding: EdgeInsets.all(16),
          // decoration: BoxDecoration(
          //     color: Colors.lightBlue.shade100
          // ),
          child:
             Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
              children:[
                  Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      // topLeft: Radius.elliptical(200, 100),
                          bottomRight:  Radius.elliptical(150,60),
                          // bottomLeft:  Radius.circular(140)
                      ),
                    gradient: new LinearGradient(
                        colors: [Colors.lightBlueAccent.withOpacity(0.6), Colors.cyanAccent.withOpacity(0.2)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft
                    ),
                  ),
                  ),
                   Positioned(
                     top: 120,
                     left: MediaQuery.of(context).size.width/3.5,
                     child: Text(""
                        "Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.blueAccent.shade400),),
                   ),
                ]),

                ClipRRect(
                    child: Image.asset("images/sih_img.png",height: 300,)),
                SizedBox(height: 30,),

                SizedBox(
                  width: 150,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(26)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(7),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.cyanAccent.shade700.withOpacity(0.4)),
                        ),
                        onPressed: () {},
                        child: const Text("Admin",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(26)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(7),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.cyanAccent.shade700.withOpacity(0.6)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (c)=>UserLogin()));
                        },
                        child: const Text("User",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
          ),
      ),
      
    );
  }
}
