import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:recipe_application/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_application/screens/recipe.dart';
import 'package:recipe_application/size_config.dart';
import 'package:recipe_application/screens/register_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool showspin = false;
  late AnimationController controller;
  late bool _passwordVisible;
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  TextEditingController _Econtroller = TextEditingController();
  TextEditingController _Pcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
    _passwordVisible = false;
  }

  void getScreenwidth() {
    print('width: ${SizeConfig.screenWidth}');
    print('height: ${SizeConfig.screenHeight}');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    getScreenwidth();
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showspin,
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 2.0,
              image: AssetImage('images/bg4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              padding: EdgeInsets.only(top: 80.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset('images/chef_PNG184.png'),
                          radius: 50,
                        ),
                        height: controller.value * 100,
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(30)),
                    Column(
                      children: [
                        AnimatedTextKit(
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
                        SizedBox(
                          height: 1,
                        ),
                        AnimatedTextKit(
                          totalRepeatCount: 3,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'LEARN HOW TO COOK',
                              textStyle: KtextStyle,
                              speed: Duration(milliseconds: 500),
                              curve: Curves.decelerate,
                              cursor: '_',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(400),
                  width: getProportionateScreenWidth(200),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 5,
                        width: SizeConfig.screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _Econtroller,
                          onChanged: (value) => email = value,
                          decoration: KtextfieldDecor.copyWith(
                            hintText: 'Enter your Username',
                            prefixIcon: KtexfieldIcon,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: TextField(
                          onChanged: (value) => password = value,
                          obscuringCharacter: '*',
                          obscureText: !_passwordVisible,
                          controller: _Pcontroller,
                          decoration: KtextfieldDecor.copyWith(
                            hintText: 'Enter your Password',
                            prefixIcon: TextButton(
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
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: Material(
                          elevation: 5.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () async {
                              _Econtroller.clear();
                              _Pcontroller.clear();
                              setState(() {
                                showspin = true;
                              });
                              try {
                                final nUser =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (nUser != null) {
                                  Navigator.pushNamed(context, RecipePage.id);
                                }
                                setState(() {
                                  showspin = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text(
                              'Login',
                            ),
                            minWidth: 200.0,
                          ),
                        ),
                      ),
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
