import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AlertDialog(
          title: const Text('Invalid Creditials !!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Seems like you have entered invalid creditials'),
                Text('Try again !!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
