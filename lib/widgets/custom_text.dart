import 'package:flutter/material.dart';
import 'package:focal_project/core/constants/app_colors.dart';

Widget mainTitle(String text){
  return Text(text,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.titleColor),);
}

Widget subTitle(String text,Color color){
  return Text(text,style:  TextStyle(fontSize: 14,color: color),);
}