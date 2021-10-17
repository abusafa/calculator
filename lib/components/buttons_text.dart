// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonsText extends StatelessWidget {
  const ButtonsText({
    Key? key,
    required this.onTap,
    required this.number,
  }) : super(key: key);
  final VoidCallback onTap;
  final String number;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(color: Colors.grey.shade800),
            ),
          )),
      child: Container(
        height: 55,
        width: 55,
        // decoration: BoxDecoration(
        //   color: Colors.grey[800],
        //   borderRadius: BorderRadius.circular(999),
        // ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
