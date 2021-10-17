import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
// import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    return ValueListenableBuilder(
        valueListenable: Hive.box('appbox').listenable(),
        builder: (context, Box box, widget) {
          int colorDivision =
              box.get('colorDivision') ?? Colors.orange.shade800.value;
          int iconColorDivision =
              box.get('iconColorDivision') ?? Colors.white.value;
          int colorAdd = box.get('colorAdd') ?? Colors.orange.shade800.value;
          int colorMinus =
              box.get('colorMinus') ?? Colors.orange.shade800.value;
          int colorMultiplication =
              box.get('colorMultiplication') ?? Colors.orange.shade800.value;

          int iconColorMinus =
              box.get('iconColorMinus') ?? Colors.orange.shade800.value;

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
                color: Color(colorMinus),
                icon: 'assets/images/minus.svg',
                iconColor: Color(iconColorMinus),
              ),
            ],
          );
        });
  }
}
