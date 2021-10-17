import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';

class FourthRow extends StatelessWidget {
  const FourthRow({
    Key? key,
    required this.ontap1,
    required this.ontap2,
    required this.ontap3,
    required this.ontapAdd,
  }) : super(key: key);
  final VoidCallback ontap1;
  final VoidCallback ontap2;

  final VoidCallback ontap3;

  final VoidCallback ontapAdd;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonsText(
          onTap: ontap1,
          number: '1',
        ),
        ButtonsText(
          onTap: ontap2,
          number: '2',
        ),
        ButtonsText(
          onTap: ontap3,
          number: '3',
        ),
        ButtonsIcon(
          onTap: ontapAdd,
          color: colorAdd,
          icon: 'assets/images/add.svg',
          iconColor: iconColorAdd,
        ),
      ],
    );
  }
}
