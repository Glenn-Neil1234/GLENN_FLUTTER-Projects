import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'LeagueSpartan',
  fontSize: 100.0,
);

const kMessageTextStyle =
    TextStyle(fontFamily: 'Montez', fontSize: 60.0, color: Colors.white);

const kButtonTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'LeagueSpartan',
    color: Colors.black,
    backgroundColor: Colors.white70,
    fontWeight: FontWeight.w500);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const KinputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 40.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.black38),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
const KinputStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontFamily: 'LeagueSpartan',
);
