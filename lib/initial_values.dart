import 'package:flutter/material.dart';

enum GenderType { male, female }
enum CardType {weight, age}

GenderType? selectedGender;

const kActiveCardColor = Color(0xFF1d1f33);
const kInactiveCardColor = Color(0xFF111328);
const kSliderOverlayColor = Color(0x29ea1556);
const kCalcButtonColor = Color(0xFFea1556);
const kTxtColor = Color(0xFF8e919e);
const kRoundButtonFillColor = Color(0xFF4c435e);
const kResultStatusColor = Color(0xFF37cd80);

const kHeadingTxtStyle = TextStyle(color: kTxtColor, fontSize: 18.0, fontWeight: FontWeight.w500);
const kHeavyTxtStyle = TextStyle(fontSize: 55.0, fontWeight: FontWeight.w900);
const kResultStatusTxtStyle = TextStyle(fontSize: 22.0, color: kResultStatusColor, fontWeight: FontWeight.bold);
const kResultTxtStyle = TextStyle(fontSize: 120.0, fontWeight: FontWeight.w900);
const kMessageTxtStyle = TextStyle(fontSize: 15.0);

int height = 180;
int weight = 60;
int age = 16;
