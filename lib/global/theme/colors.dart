
import 'package:flutter/material.dart';

import 'dart:math' as math;

// naro Color
const naroColor = Color(0xFF003300);

// naro secondary color
const naroSecondaryColor = Color(0xFFFFEB3B);

// red
const naroRed = Color(0xFFCD0000);

// naro background
const naroBackground = Color(0xFF200E32);

// naro white
const naroWhite = Color(0xFFFFFFFF);

// naro black
const naroBlack = Color(0xFF000000);

// naro transparent
const naroTransparent = Colors.transparent;

// naro random color
Color get naroRandomColor =>
    Color((math.Random().nextDouble() * 0xFFE3EEFE).toInt()).withOpacity(1.0);

