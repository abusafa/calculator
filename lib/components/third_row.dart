import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';

class ThirdRow extends StatelessWidget {
  const ThirdRow({
    Key? key,
    required this.ontap4,
    required this.ontap5,
    required this.ontap6,
    required this.ontapMinus,
  }) : super(key: key);
  final VoidCallback ontap4;
  final VoidCallback ontap5;

  final VoidCallback ontap6;

  final VoidCallback ontapMinus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonsText(
          onTap: ontap4,
          number: '4',
        ),
        ButtonsText(
          onTap: ontap5,
          number: '5',
        ),
        ButtonsText(
          onTap: ontap6,
          number: '6',
        ),
        ButtonsIcon(
          onTap: ontapMinus,
          color: colorMinus,
          icon: 'assets/images/minus.svg',
          iconColor: iconColorMinus,
        ),
      ],
    );
  }
}
