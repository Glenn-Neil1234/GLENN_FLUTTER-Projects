import 'package:flutter/material.dart';
import 'package:recipe_application/constants.dart';
import 'package:recipe_application/screens/recipe.dart';
import 'package:recipe_application/services/recipemodels.dart';
import 'package:recipe_application/size_config.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.getid});
  final getid;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String foodtitle1 = '';
  String foodtitle2 = '';
  String foodtitle3 = '';
  String foodtitle4 = '';
  String foodtitle5 = '';
  String foodtitle6 = '';
  String foodtitle7 = '';
  String foodtitle8 = '';
  String foodtitle9 = '';
  String foodtitle10 = '';

  int id = 0;
  int id1 = 0;
  int id2 = 0;
  int id3 = 0;
  int id4 = 0;
  int id5 = 0;
  int id6 = 0;
  int id7 = 0;
  int id8 = 0;
  int id9 = 0;
  int id10 = 0;
  @override
  void initState() {
    super.initState();
    getsearchdata(widget.getid);
  }

  void getsearchdata(dynamic query) async {
    // di pa tapos
    var recipeData = await RecipeModel().getsearchrecipe(query);
    setState(() {
      if (recipeData == null) {
        print('query not found');
        return;
      } else {
        int foodid1 = recipeData[0]['id'];
        id1 = foodid1;
        print(id);

        int foodid2 = recipeData[1]['id'];
        id2 = foodid2;

        int foodid3 = recipeData[2]['id'];
        id3 = foodid3;

        int foodid4 = recipeData[3]['id'];
        id4 = foodid4;

        int foodid5 = recipeData[4]['id'];
        id5 = foodid5;

        int foodid6 = recipeData[5]['id'];
        id6 = foodid6;

        int foodid7 = recipeData[6]['id'];
        id7 = foodid7;

        int foodid8 = recipeData[7]['id'];
        id8 = foodid8;

        int foodid9 = recipeData[8]['id'];
        id9 = foodid9;

        int foodid10 = recipeData[9]['id'];
        id10 = foodid10;

        String title1 = recipeData[0]['title'];
        foodtitle1 = title1;
        String title2 = recipeData[1]['title'];
        foodtitle2 = title2;
        String title3 = recipeData[2]['title'];
        foodtitle3 = title3;
        String title4 = recipeData[3]['title'];
        foodtitle4 = title4;
        String title5 = recipeData[4]['title'];
        foodtitle5 = title5;
        String title6 = recipeData[5]['title'];
        foodtitle6 = title6;
        String title7 = recipeData[6]['title'];
        foodtitle7 = title7;
        String title8 = recipeData[7]['title'];
        foodtitle8 = title8;
        String title9 = recipeData[8]['title'];
        foodtitle9 = title9;
        String title10 = recipeData[9]['title'];
        foodtitle10 = title10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Expanded(
                child: Container(
              height: getProportionateScreenHeight(400),
              width: SizeConfig.screenWidth,
              color: Colors.blueGrey.withOpacity(0.7),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  TextButton(
                    onPressed: () {
                      id = id1;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle1',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id2;
                      Navigator.push(context, 
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle2',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id3;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle3',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id4;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle4',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id5;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle5',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id6;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle6',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id7;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle7',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id8;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle8',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id9;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle9',
                      style: searchsty,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextButton(
                    onPressed: () {
                      id = id10;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RecipePage(
                          recipeDet: id,
                        );
                      }));
                    },
                    child: Text(
                      '$foodtitle10',
                      style: searchsty,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
