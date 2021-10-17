import 'package:calculator_app/components/AC_button.dart';
import 'package:calculator_app/components/buttons_icon.dart';
// import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
    required this.onTapAC,
    required this.onTapMinusPlus,
    required this.onTapPercent,
    required this.onTapDivision,
    // required this.acOrc,
  }) : super(key: key);
  final VoidCallback onTapAC;
  // final String acOrc;
  final VoidCallback onTapMinusPlus;

  final VoidCallback onTapPercent;

  final VoidCallback onTapDivision;

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

        String acOrcText = box.get('acOrcText') ?? "AC";

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ACButton(
              acOrc: acOrcText,
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
              color: Color(colorDivision),
              icon: 'assets/images/division.svg',
              iconColor: Color(iconColorDivision),
            ),
          ],
        );
      },
    );
  }
}
