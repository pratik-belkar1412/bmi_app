import 'package:flutter/material.dart';

const Color backgroundColour = Color.fromARGB(255, 1, 17, 42);
const Color cardColour = Color.fromARGB(255, 41, 46, 65);

const TextStyle kTitleTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);

const BoxDecoration kActiveCardDecoration = BoxDecoration(
  color: cardColour,
  borderRadius: BorderRadius.all(Radius.circular(15)),
);

const BoxDecoration kInactiveCardDecoration = BoxDecoration(
  color: Color.fromARGB(255, 1, 17, 42),
  borderRadius: BorderRadius.all(Radius.circular(15)),
);
