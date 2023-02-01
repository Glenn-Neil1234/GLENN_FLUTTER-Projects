import 'package:flutter/material.dart';
import 'package:recipe_application/services/recipemodels.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/recipe.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        RecipePage.id: (context) => RecipePage(),
      },
    );
  }
}
