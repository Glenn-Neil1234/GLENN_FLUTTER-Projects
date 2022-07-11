import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/components/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final EtextController = TextEditingController();
final PtextController = TextEditingController();

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 40.0),
                //   child: Align(
                //     alignment: Alignment.topLeft,
                //     child: TextButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       child: Icon(
                //         Icons.arrow_back,
                //         size: 50.0,
                //       ),
                //     ),
                //   ),
                // ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: EtextController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                    //Do something with the user input.
                  },
                  decoration: KTextFieldDecoration.copyWith(
                      hintText: 'Enter your Email'),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: PtextController,
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: KTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password'),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    color: Colors.lightBlueAccent,
                    label: 'Log in',
                    onPressed: () async {
                      EtextController.clear();
                      PtextController.clear();
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: isloggedin
                //       ? Text(
                //           'Login successful!',
                //           key: Key('loggedIn'),
                //           style: TextStyle(fontSize: 20.0),
                //         )
                //       : Text(
                //           'Not logged in',
                //           key: Key('notLoggedIn'),
                //           style: TextStyle(fontSize: 20.0),
                //         ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
