import 'package:bagstore/Core/themaing/font_weight_helper.dart';
import 'package:flutter/material.dart';

// main function the all type return it
TextStyle _getTexStyle(
  double fontsize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(fontSize: fontsize, color: color, fontWeight: fontWeight);
}

// Regular Text Style

TextStyle getRegularStyle({
  double fontsize = 14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.regular, color);
}

// medium Text Style

TextStyle getMediumStyle({
  double fontsize = 14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.medium, color);
}

// bold Text Style

TextStyle getBoldStyle({
  double fontsize = 14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.bold, color);
}

// semibold Text Style

TextStyle getSemiboldStyle({
  double fontsize = 14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.semibold, color);
}

// light Text Style

TextStyle getlightStyle({
  double fontsize = 14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.light, color);
}
