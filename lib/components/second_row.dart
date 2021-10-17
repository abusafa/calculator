import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
// import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    return ValueListenableBuilder(
      valueListenable: Hive.box('appbox').listenable(),
      builder: (context, Box box, widget) {
        int colorDivision =
            box.get('colorDivision') ?? Colors.orange.shade800.value;
        int iconColorDivision =
            box.get('iconColorDivision') ?? Colors.white.value;
        int colorAdd = box.get('colorAdd') ?? Colors.orange.shade800.value;
        int colorMinus = box.get('colorMinus') ?? Colors.orange.shade800.value;
        int colorMultiplication =
            box.get('colorMultiplication') ?? Colors.orange.shade800.value;
        int iconColorMultiplication =
            box.get('iconColorMultiplication') ?? Colors.orange.shade800.value;

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
              color: Color(colorMultiplication),
              icon: 'assets/images/multiplication.svg',
              iconColor: Color(iconColorMultiplication),
            ),
          ],
        );
      },
    );
  }
}
