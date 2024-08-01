import 'package:flutter/material.dart';

Gradient bgGradient = const LinearGradient(
    colors: [
      Color(0xFF158AD4),
      Color(0xFF39EADD)
    ],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(0.0, 1.0),
    stops: [
      0.0,
      1.0
    ],
    tileMode: TileMode.clamp);

Gradient btnGradient = const LinearGradient(
    colors: [
      Color(0xFF158AD4),
      Color(0xFF39EADD)
    ],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(0.0, 1.0),
    stops: [
      0.0,
      1.0
    ],
    tileMode: TileMode.clamp);

BoxShadow boxShadow = BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 3, blurRadius: 2, offset: const Offset(0, 3));
