import 'package:flutter/material.dart';

Widget mainTitle(String text,Color color){
  return Text(text,style:  TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: color),);
}

Widget subTitle(String text,Color color,FontWeight? fontWeight,double? size){
  return Text(textWidthBasis: TextWidthBasis.longestLine,text,style:  TextStyle(fontSize: size ?? 14,
  color: color,fontWeight: fontWeight!),);
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.text, required this.color, this.fontWeight, this.size});
final String text;
final Color color;
final FontWeight? fontWeight;
final double? size;
  @override
  Widget build(BuildContext context) {
    return  Text(textWidthBasis: TextWidthBasis.longestLine,text,style:  TextStyle(fontSize: size ?? 14,
  color: color,fontWeight: fontWeight!),);
  }
}