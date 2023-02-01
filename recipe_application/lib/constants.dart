import 'package:flutter/material.dart';

const KtextStyle = TextStyle(
  fontFamily: 'Permanent Marker',
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const Ktitle =
    TextStyle(fontFamily: 'Pacifico', fontSize: 35.0, color: Colors.black);

const KtextfieldDecor = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  prefixIcon: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
  ),
  hintText: '',
  hintStyle: TextStyle(color: Colors.black38),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

const KtexfieldIcon = Padding(
  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  child: Icon(
    Icons.person,
    color: Colors.black,
    size: 40.0,
  ),
);

const Ktext = TextStyle(fontSize: 20, fontFamily: 'SSP', color: Colors.black);

const ksumstyle = TextStyle(
    fontSize: 20, fontFamily: 'Permanent Marker', color: Colors.black);
const KdetTexts = TextStyle(fontFamily: 'Ibarra');
const searchsty = TextStyle(color: Colors.white, fontFamily: 'SSP');
