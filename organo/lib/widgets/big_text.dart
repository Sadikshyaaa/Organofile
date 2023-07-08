import 'package:flutter/material.dart';
import 'package:organo/utlis/dimension.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({super.key, this.color= const Color(0xFF332d2b),
   required this.text,
   this.size=20,
   this.overflow=TextOverflow.ellipsis
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: "Trajan Pro",
        color: color,
        fontSize: size ==0?Dimensions.font20:size,
        fontWeight: FontWeight.w700

      ),
    );
  }
}