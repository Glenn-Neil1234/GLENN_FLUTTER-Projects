import 'package:flash_chat_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flash_chat_app/components/rounded_button.dart';

final _auth = FirebaseAuth.instance;

class LogoutScreen extends StatelessWidget {
  static const String id = 'logout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: Text('Log out'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: RoundedButton(
          color: Colors.blueAccent,
          label: 'Log out',
          onPressed: () {
            Navigator.pushNamed(context, WelcomeScreen.id);
          },
        )),
      ),
    );
  }
}
