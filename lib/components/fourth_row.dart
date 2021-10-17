import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
// import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          int iconColorAdd =
              box.get('iconColorAdd') ?? Colors.orange.shade800.value;

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
                color: Color(colorAdd),
                icon: 'assets/images/add.svg',
                iconColor: Color(iconColorAdd),
              ),
            ],
          );
        });
  }
}
