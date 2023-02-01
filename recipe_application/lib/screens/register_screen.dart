import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_application/constants.dart';
import 'package:recipe_application/screens/recipe.dart';
import 'package:recipe_application/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showSpinner = false;
  late bool _passwordVisible;
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  TextEditingController _Econtroller = TextEditingController();
  TextEditingController _Pcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              opacity: 0.8,
              image: AssetImage('images/bg4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 30.0,
                  ),
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset('images/chef_PNG184.png'),
                        radius: 40,
                      ),
                      height: 80,
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedTextKit(
                  pause: Duration(seconds: 5),
                  repeatForever: true,
                  animatedTexts: [
                    WavyAnimatedText(
                      'Chef Maker',
                      textStyle: Ktitle,
                      speed: Duration(milliseconds: 500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(300),
                width: getProportionateScreenWidth(200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey.shade200.withOpacity(0.8),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _Econtroller,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: KtextfieldDecor.copyWith(
                          hintText: 'Enter your Username',
                          prefixIcon: KtexfieldIcon,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscuringCharacter: '*',
                        obscureText: !_passwordVisible,
                        autocorrect: true,
                        controller: _Pcontroller,
                        decoration: KtextfieldDecor.copyWith(
                          hintText: 'Enter your Password',
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 2.0, right: 0.0),
                            child: TextButton(
                              child: Icon(
                                _passwordVisible
                                    ? Icons.lock_open_rounded
                                    : Icons.lock,
                                color: Colors.black,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 5.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {}
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              minWidth: 100.0,
                              height: getProportionateScreenHeight(42),
                              child: Text(
                                'Register',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          Material(
                            elevation: 5.0,
                            color: Colors.lightBlueAccent[50],
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              onPressed: () async {
                                _Econtroller.clear();
                                _Pcontroller.clear();
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final newUser =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {
                                    Navigator.pushNamed(context, RecipePage.id);
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              minWidth: 100.0,
                              height: getProportionateScreenHeight(42),
                              child: Text(
                                'Login',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Divider(
                          thickness: 5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
