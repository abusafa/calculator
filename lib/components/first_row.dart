import 'package:calculator_app/components/AC_button.dart';
import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
    required this.onTapAC,
    required this.onTapMinusPlus,
    required this.onTapPercent,
    required this.onTapDivision,
    required this.acOrc,
  }) : super(key: key);
  final VoidCallback onTapAC;
  final String acOrc;
  final VoidCallback onTapMinusPlus;

  final VoidCallback onTapPercent;

  final VoidCallback onTapDivision;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ACButton(
          acOrc: acOrc,
          onTap: onTapAC,
        ),
        ButtonsIcon(
          onTap: onTapMinusPlus,
          color: Color(0xff9F9F9F),
          icon: 'assets/images/minusPlus.svg',
          iconColor: Colors.black,
        ),
        ButtonsIcon(
          onTap: onTapPercent,
          color: Color(0xff9F9F9F),
          icon: 'assets/images/percent.svg',
          iconColor: Colors.black,
        ),
        ButtonsIcon(
          onTap: onTapDivision,
          color: colorDivision,
          icon: 'assets/images/division.svg',
          iconColor: iconColorDivision,
        ),
      ],
    );
  }
}
