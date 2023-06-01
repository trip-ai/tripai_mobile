import 'package:flutter/material.dart';
import 'package:tripai/constants/const_colors.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final double? decorationThickness;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final bool? softWrap;
  final double? wordSpacing;
  final double? height;
  final double? letterSpacing;
  final String? fontFamily;
  final FontStyle fontStyle;

  const TextContainer(
    this.text, {
    Key? key,
    this.textColor = ConstColors.gray900,
    this.backgroundColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.decorationThickness,
    this.textOverflow = TextOverflow.clip,
    this.maxLine,
    this.softWrap,
    this.wordSpacing,
    this.height = 1.25,
    this.letterSpacing,
    this.fontFamily,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      softWrap: softWrap,
      style: TextStyle(
        color: textColor,
        backgroundColor: backgroundColor,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
        decorationThickness: decorationThickness,
        wordSpacing: wordSpacing,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
