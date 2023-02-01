import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'networking.dart';

const apiKey = '62eaba7163a444b7aba286c1abb9071b';
const spoonacularURL = 'https://api.spoonacular.com/recipes';
const random = 'random';
const autocomplete = 'autocomplete';

class RecipeModel {
  // random recipe
  Future<dynamic> getrecipeModel() async {
    Network network =
        Network('$spoonacularURL/$random?apiKey=$apiKey&includeNutrition=true');

    var recipeData = await network.getData();

    return recipeData;
  }

  // autocomplete search di pa tapos
  Future<dynamic> getsearchrecipe(String query) async {
    Network network = Network(
        '$spoonacularURL/$autocomplete?number=10&query=$query&apiKey=$apiKey');

    var recipeData = await network.getData();

    return recipeData;
  }

  // recipe info di pa tapos
  Future<dynamic> getsearchrecipeinfo(int id) async {
    Network network = Network(
        '$spoonacularURL/$id/information?includeNutrition=false&apiKey=$apiKey');

    var recipeData = await network.getData();

    return recipeData;
  }

  String getCreditsDisplay(String credits) {
    // credit source
    if (credits == null) {
      return 'N/A';
    } else {
      return credits;
    }
  }

  String getSourceDisplay(String srcName) {
    // source name
    if (srcName == null) {
      return 'N/A';
    } else {
      return srcName;
    }
  }

  String getLicenseDisplay(String licensenum) {
    // source name
    if (licensenum == null) {
      return 'N/A';
    } else {
      return licensenum;
    }
  }

  String getSummaryDisplay(String Dishsummary) {
    // summary
    Dishsummary = Dishsummary.replaceAll('<b>', '');
    Dishsummary = Dishsummary.replaceAll('</b>', '');
    Dishsummary = Dishsummary.replaceAll('<a>', '');
    Dishsummary = Dishsummary.replaceAll('</a>', '');
    Dishsummary = Dishsummary.replaceAll('<a', '');

    return Dishsummary;
  }

  String getProcedureDisplay(String proced) {
    // summary
    proced = proced.replaceAll('<ol>', '');
    proced = proced.replaceAll('<li>', '');
    proced = proced.replaceAll('</li>', '');
    proced = proced.replaceAll('</ol>', '');
    proced = proced.replaceAll('<', '');

    return proced;
  }

  Object getboolDisplay1(bool veg) {
    // vegetarian
    if (veg == false) {
      return '';
    } else {
      return 'Vegetarian';
    }
  }

  Object getboolDisplay2(bool vegaN) {
    // vegan
    if (vegaN == false) {
      return '';
    } else {
      return 'Vegan';
    }
  }

  Object getboolDisplay3(bool glutenFree) {
    // gluten free
    if (glutenFree == false) {
      return '';
    } else {
      return 'Gluten Free';
    }
  }

  Object getboolDisplay4(bool dairyFree) {
    // dairy free
    if (dairyFree == false) {
      return '';
    } else {
      return 'Dairy Free';
    }
  }

  Object getboolDisplay5(bool veryhealthy) {
    // very healthy
    if (veryhealthy == false) {
      return '';
    } else {
      return 'Very Healthy';
    }
  }

  Object getboolDisplay6(bool cheap) {
    // cheap
    if (cheap == false) {
      return '';
    } else {
      return 'Cheap';
    }
  }

  Object getboolDisplay7(bool veryPopular) {
    // very popular
    if (veryPopular == false) {
      return '';
    } else {
      return 'Very Popular';
    }
  }
}
