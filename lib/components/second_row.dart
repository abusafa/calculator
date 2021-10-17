import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({
    Key? key,
    required this.onTap7,
    required this.onTap8,
    required this.onTap9,
    required this.onTapMultiplication,
  }) : super(key: key);
  final VoidCallback onTap7;
  final VoidCallback onTap8;

  final VoidCallback onTap9;

  final VoidCallback onTapMultiplication;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonsText(
          onTap: onTap7,
          number: '7',
        ),
        ButtonsText(
          onTap: onTap8,
          number: '8',
        ),
        ButtonsText(
          onTap: onTap9,
          number: '9',
        ),
        ButtonsIcon(
          onTap: onTapMultiplication,
          color: colorMultiplication,
          icon: 'assets/images/multiplication.svg',
          iconColor: iconColorMultiplication,
        ),
      ],
    );
  }
}
