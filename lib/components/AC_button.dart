// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ACButton extends StatelessWidget {
  const ACButton({
    Key? key,
    required this.onTap,
    required this.acOrc,
  }) : super(key: key);
  final VoidCallback onTap;
  final String acOrc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(color: Colors.grey.shade500),
            ),
          )),
      child: Container(
        height: 55,
        width: 55,
        child: Center(
          child: Text(
            acOrc,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
