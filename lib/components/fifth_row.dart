import 'package:calculator_app/components/ButtonDot.dart';
import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/zero_button.dart';
import 'package:flutter/material.dart';

class FifthRow extends StatelessWidget {
  const FifthRow({
    Key? key,
    required this.ontap0,
    required this.ontapPoint,
    required this.ontapEqual,
  }) : super(key: key);
  final VoidCallback ontap0;
  final VoidCallback ontapPoint;

  final VoidCallback ontapEqual;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ZeroButton(
          onTap: ontap0,
          number: '0',
        ),
        ButtonDot(
          onTap: ontapPoint,
          number: '.',
        ),
        ButtonsIcon(
          onTap: ontapEqual,
          color: Color(0xffF69906),
          icon: 'assets/images/equal.svg',
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
