import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

Widget mainTitle(String text,Color color){
  return Text(text,style:  TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: color),);
}

Widget subTitle(String text,Color color,FontWeight? fontWeight){
  return Text(textWidthBasis: TextWidthBasis.longestLine,text,style:  TextStyle(fontSize: 14,color: color,fontWeight: fontWeight!),);
}