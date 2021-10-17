import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hive_flutter/hive_flutter.dart';

dynamic schema = {
  "numberTap": (int value) {
    Box box = Hive.box('appbox');
    dynamic mainNumber = box.get('main_number');

    int colorAdd = box.get('colorAdd');
    int colorDivision = box.get(
          'colorDivision',
        ) ??
        Colors.pink.value;
    int colorMinus = box.get(
          'colorMinus',
        ) ??
        Colors.pink.value;
    int colorMultiplication = box.get(
          'colorMultiplication',
        ) ??
        Colors.pink.value;

    int iconColorMinus = box.get(
          'iconColorMinus',
        ) ??
        Colors.pink.value;
    int iconColorMultiplication = box.get(
          'iconColorMultiplication',
        ) ??
        Colors.pink.value;
    int iconColorDivision = box.get(
          'iconColorDivision',
        ) ??
        Colors.pink.value;
    int iconColorAdd = box.get(
          'iconColorAdd',
        ) ??
        Colors.pink.value;

    String acOrcText = box.get(
          'acOrcText',
        ) ??
        "AC";

    int mark = box.get(
          'mark',
        ) ??
        0;

    int finalMark = box.get(
          'finalMark',
        ) ??
        0;

    bool afterEquals = box.get(
          'afterEquals',
        ) ??
        false;
    //  Vibrate.vibrate();
    Vibrate.feedback(FeedbackType.impact);

    if (mainNumber > 0.0) {
      mainNumber = mainNumber * 10 + value;
    }
    if (mainNumber < 0) {
      mainNumber = mainNumber * 10 - value;
    }
    if (mainNumber == 0.0) {
      mainNumber = value;
      acOrcText = 'C';
    }
    if (mark > 0 && finalMark > 0) {
      mark = 0;
      mainNumber = 0 + value;
    }
    // if (firstNumber != 0 && secondNumber != 0) {
    //   mainNumber = 0 + 7;
    // }
    colorAdd = 0xffF69906;
    colorDivision = 0xffF69906;
    colorMinus = 0xffF69906;
    colorMultiplication = 0xffF69906;

    iconColorMinus = Colors.white.value;
    iconColorMultiplication = Colors.white.value;
    iconColorDivision = Colors.white.value;
    iconColorAdd = Colors.white.value;
    if (afterEquals == true) {
      mainNumber = 0 + value;
    }
    afterEquals = false;

    box.put('main_number', mainNumber);

    box.put('colorAdd', colorAdd);
    box.put('colorDivision', colorDivision);
    box.put('colorMinus', colorMinus);
    box.put('colorMultiplication', colorMultiplication);

    box.put('iconColorMinus', iconColorMinus);
    box.put('iconColorMultiplication', iconColorMultiplication);
    box.put('iconColorDivision', iconColorDivision);
    box.put('iconColorAdd', iconColorAdd);

    box.put('mark', mark);
    box.put('acOrcText', acOrcText);
    box.put('finalMark', finalMark);
    box.put('afterEquals', afterEquals);
  },
};
