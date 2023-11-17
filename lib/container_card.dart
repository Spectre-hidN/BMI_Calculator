import 'package:flutter/material.dart';


class ContainerCard extends StatelessWidget {
  final EdgeInsets margin;
  final Color bgColor;
  final Widget? cardChild;
  final VoidCallback? onPress; 

  const ContainerCard(
      {super.key,
      required this.margin,
      required this.bgColor,
      this.cardChild,
      this.onPress
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(7.0)),
        child: cardChild,
      ),
    );
  }
}