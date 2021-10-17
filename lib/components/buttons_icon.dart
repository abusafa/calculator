// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonsIcon extends StatelessWidget {
  const ButtonsIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.color,
    required this.iconColor,
  }) : super(key: key);
  final VoidCallback onTap;
  final String icon;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
                side: BorderSide(color: color),
              ),
            )),
        child: Container(
          height: 55,
          width: 55,
          child: Center(
            child: Container(
              height: 35,
              width: 25,
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
