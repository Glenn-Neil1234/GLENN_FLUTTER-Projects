import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recipe_application/constants.dart';
import 'package:recipe_application/screens/login_screen.dart';
import 'package:recipe_application/screens/recipe_searchscreen.dart';
import 'package:recipe_application/services/recipemodels.dart';
import 'package:recipe_application/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

const apiKey = '3f20e6f9b12a4a378d5a05446592d682';

class RecipePage extends StatefulWidget {
  RecipePage({this.recipeDet});
  final recipeDet;
  static const String id = 'recipe';

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  RecipeModel recipeModel = RecipeModel();
  String query = '';

  String rname = '';
  String cred = '';
  String srcname = '';
  String license = '';
  String summary = '';
  String spoonacURL = '';
  String dishType = '';
  String URLlink = '';
  String procedure = '';

  var vegan;
  var gluten;
  var dairy;
  var healthy;
  var price;
  var vegetarian;
  var popularity;
  var imgUrl;

  int num = 0;
  late bool shwspin;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // print('glenn: ${widget.recipeDet}');
    getrecipeData();
    update(widget.recipeDet);
    shwspin = false;
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void update(dynamic id) async {
    var recipeData = await RecipeModel().getsearchrecipeinfo(id);
    print('recipeinfo: $recipeData');

    setState(() {
      try {
        if (recipeData == null) {
          print('recipes not found');
          return;
        } else {
          // string data
          String name = recipeData['title'];
          rname = name;
          String credits = recipeData['creditsText'];
          cred = recipeModel.getCreditsDisplay(credits);
          String srcName = recipeData['sourceName'];
          srcname = recipeModel.getSourceDisplay(srcName);
          String licensenum = recipeData['license'];
          license = recipeModel.getLicenseDisplay(licensenum);
          String link = recipeData['sourceUrl'];
          URLlink = link;
          var imglink = recipeData['image'];
          imgUrl = imglink;
          String Dishsummary = recipeData['summary'];
          summary = recipeModel.getSummaryDisplay(Dishsummary);
          String spoonacular = recipeData['spoonacularSourceUrl'];
          spoonacURL = spoonacular;
          String dishtype = recipeData['dishTypes'][0];
          dishType = dishtype;
          String proced = recipeData['instructions'];
          procedure = recipeModel.getProcedureDisplay(proced);

          // bool data
          bool veg = recipeData['vegetarian'];
          vegetarian = recipeModel.getboolDisplay1(veg);
          bool vegaN = recipeData['vegan'];
          vegan = recipeModel.getboolDisplay2(vegaN);
          bool glutenFree = recipeData['glutenFree'];
          gluten = recipeModel.getboolDisplay3(glutenFree);
          bool dairyFree = recipeData['dairyFree'];
          dairy = recipeModel.getboolDisplay4(dairyFree);
          bool veryhealthy = recipeData['veryHealthy'];
          healthy = recipeModel.getboolDisplay5(veryhealthy);
          bool cheap = recipeData['cheap'];
          price = recipeModel.getboolDisplay6(cheap);
          bool veryPopular = recipeData['veryPopular'];
          popularity = recipeModel.getboolDisplay7(veryPopular);
        }
      } catch (e) {
        print(e);
      }
    });
  }

  void getrecipeData() async {
    var recipeData = await RecipeModel().getrecipeModel();
    print(recipeData);

    setState(() {
      try {
        if (recipeData == null) {
          print('recipes not found');
          return;
        } else {
          // string data
          String name = recipeData['recipes'][0]['title'];
          rname = name;
          String credits = recipeData['recipes'][0]['creditsText'];
          cred = recipeModel.getCreditsDisplay(credits);
          String srcName = recipeData['recipes'][0]['sourceName'];
          srcname = recipeModel.getSourceDisplay(srcName);
          String licensenum = recipeData['recipes'][0]['license'];
          license = recipeModel.getLicenseDisplay(licensenum);
          String link = recipeData['recipes'][0]['sourceUrl'];
          URLlink = link;
          var imglink = recipeData['recipes'][0]['image'];
          imgUrl = imglink;
          String Dishsummary = recipeData['recipes'][0]['summary'];
          summary = recipeModel.getSummaryDisplay(Dishsummary);
          String spoonacular = recipeData['recipes'][0]['spoonacularSourceUrl'];
          spoonacURL = spoonacular;
          String dishtype = recipeData['recipes'][0]['dishTypes'][0];
          dishType = dishtype;
          String proced = recipeData['recipes'][0]['instructions'];
          procedure = recipeModel.getProcedureDisplay(proced);

          // bool data
          bool veg = recipeData['recipes'][0]['vegetarian'];
          vegetarian = recipeModel.getboolDisplay1(veg);
          bool vegaN = recipeData['recipes'][0]['vegan'];
          vegan = recipeModel.getboolDisplay2(vegaN);
          bool glutenFree = recipeData['recipes'][0]['glutenFree'];
          gluten = recipeModel.getboolDisplay3(glutenFree);
          bool dairyFree = recipeData['recipes'][0]['dairyFree'];
          dairy = recipeModel.getboolDisplay4(dairyFree);
          bool veryhealthy = recipeData['recipes'][0]['veryHealthy'];
          healthy = recipeModel.getboolDisplay5(veryhealthy);
          bool cheap = recipeData['recipes'][0]['cheap'];
          price = recipeModel.getboolDisplay6(cheap);
          bool veryPopular = recipeData['recipes'][0]['veryPopular'];
          popularity = recipeModel.getboolDisplay7(veryPopular);

          // int data
          int stepnum1 = recipeData['recipes'][0]['analyzedInstructions'][0]
              ['steps'][0]['number'];
          num = stepnum1.toInt();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        centerTitle: true,
        title: Text(
          'Chef Maker',
          style: Ktitle,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();

                Navigator.pushNamed(context, LoginScreen.id);
              }),
        ],
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            filterQuality: FilterQuality.high,
            opacity: 0.9,
            image: AssetImage('images/bg5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextField(
                onChanged: (value) {
                  query = value;
                },
                decoration: KtextfieldDecor.copyWith(
                  hintText: 'Search Recipe',
                  hintStyle: TextStyle(color: Colors.black54),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return SearchScreen(getid: query);
                        })));
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                // height: getProportionateScreenHeight(SizeConfig.screenHeight),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white70.withOpacity(0.7)),
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    RichText(
                      overflow: TextOverflow.fade,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$rname',
                            style: TextStyle(
                              fontFamily: 'Cormo',
                              fontSize: 35,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                      child: Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                    Image.network(
                      (imgUrl == null
                          ? 'https://www.elegantthemes.com/blog/wp-content/uploads/2019/10/loading-screen-featured-image.jpg'
                          : imgUrl),
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(150),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Text(
                      'Details ',
                      style: Ktext,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$vegetarian',
                            style: KdetTexts.copyWith(
                                backgroundColor: Colors.yellow[200])),
                        Text(
                          '$vegan',
                          style: KdetTexts.copyWith(
                              backgroundColor: Colors.green[200]),
                        ),
                        Text(
                          '$gluten',
                          style: KdetTexts.copyWith(
                              backgroundColor: Colors.lightBlueAccent[200]),
                        ),
                        Text(
                          '$dairy',
                          style: KdetTexts.copyWith(
                              backgroundColor: Colors.red[200]),
                        ),
                        Text(
                          '$healthy',
                          style: KdetTexts.copyWith(
                              backgroundColor: Colors.teal[200]),
                        ),
                        Text(
                          '$price',
                          style: KdetTexts.copyWith(
                              backgroundColor: Colors.orange[200]),
                        ),
                        Text(
                          '$popularity',
                          style: KdetTexts.copyWith(
                              backgroundColor: Colors.greenAccent[200]),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Type of Dish: ',
                            style: Ktext,
                          ),
                          TextSpan(
                            text: '\n$dishType',
                            style: Ktext.copyWith(fontFamily: 'Cormo'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Summary: ',
                            style: Ktext,
                          ),
                          TextSpan(
                            text: '\n$summary',
                            style: Ktext.copyWith(fontFamily: 'Cormo'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Procedure: ',
                            style: Ktext,
                          ),
                          TextSpan(
                            text: '\n$procedure',
                            style: Ktext.copyWith(fontFamily: 'Cormo'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Text(
                      'Credits to: $cred',
                      style: Ktext,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      'Source name: $srcname',
                      style: Ktext,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      'License: $license',
                      style: Ktext,
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'SpoonacularSourceURL: ',
                            style: Ktext,
                          ),
                          TextSpan(
                            text: '\n$spoonacURL',
                            style: Ktext.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: 'SourceURL: ',
                            style: Ktext,
                          ),
                          TextSpan(
                            text: '\n$URLlink',
                            style: Ktext.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
