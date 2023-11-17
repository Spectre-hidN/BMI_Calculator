import 'package:flutter/material.dart';

class GenderCardContents extends StatelessWidget {
  final String text;
  final IconData icon;
  final double? iconSize;
  final double? sizedBoxHeight;
  final double? fontSize;
  final Color txtColor;

  const GenderCardContents(
      {super.key,
      required this.text,
      required this.icon,
      required this.txtColor,
      this.iconSize,
      this.sizedBoxHeight,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: iconSize ?? 80.0),
        SizedBox(
          height: sizedBoxHeight ?? 15.0,
        ),
        Text(
          text,
          style: TextStyle(fontSize: fontSize ?? 18.0, color: txtColor, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  final VoidCallback? callback;
  final EdgeInsets? padding;
  final Icon? icon;
  
  final Color fillColor;
  final double height;
  final double width;

  const RoundButton(
    {super.key, 
    required this.callback, 
    required this.fillColor,
    required this.height,
    required this.width,
    this.icon,
    this.padding
    });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      shape: const CircleBorder(),
      padding: padding ?? const EdgeInsets.all(2.0),
      fillColor: fillColor,
      constraints: BoxConstraints.tightFor(
        width: width,
        height: height
      ),
      child: icon
    );
  }
}
