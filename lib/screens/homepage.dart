import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sih_project/screens/userlogin.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            Text(
              "View all",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Center(child: Text("General Awareness")),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              height: 200,
              child: Card(
                color: Colors.lightBlue.shade100,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("General Awareness regarding issues "),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            Text(
              "View all",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: Drawer(
          child: Container(
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: ListView(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    height: 20,
                  ),
                  // Image.asset(
                  //   "images/profile.png",
                  //   height: 100,
                  //   width: 100,
                  // ),
                  Column(
                    children: [Text("Name"), Text("AGE"), Text("ID")],
                  )
                ],
              ),
              // backgroundImage: AssetImage("images/profile.png",)
            ),
            ListTile(
              title: const Text(
                'Previous History',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Check Schemes',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Hospital',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Edit Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("User log out succesfully");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => UserLogin()));
                }).onError((error, stackTrace) {
                  print("Unable to log out...Try again");
                });
              },
            ),
          ],
        ),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
