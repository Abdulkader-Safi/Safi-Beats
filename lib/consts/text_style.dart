import 'package:beats/consts/colors.dart';
import 'package:flutter/material.dart';

outStyle({weight = FontWeight.bold, double? size = 14, color = whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
  );
}
