// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ZeroButton extends StatelessWidget {
  const ZeroButton({
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
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(color: Colors.grey.shade800),
            ),
          )),
      child: Container(
        height: 55,
        width: 160,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              number,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ]),
      ),
    );
  }
}
