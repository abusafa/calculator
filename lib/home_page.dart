// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:calculator_app/components/AC_button.dart';
import 'package:calculator_app/components/ButtonDot.dart';
import 'package:calculator_app/components/buttons_icon.dart';
import 'package:calculator_app/components/buttons_text.dart';
import 'package:calculator_app/components/calculator_top_screen.dart';
import 'package:calculator_app/components/fifth_row.dart';
import 'package:calculator_app/components/first_row.dart';
import 'package:calculator_app/components/fourth_row.dart';
import 'package:calculator_app/components/second_row.dart';
import 'package:calculator_app/components/third_row.dart';
import 'package:calculator_app/components/zero_button.dart';
import 'package:calculator_app/schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String acOrcText = 'AC';
dynamic firstNumber = 0;
dynamic secondNumber = 0;
dynamic mainNumber = 0;
int mark = 0;
int finalMark = 0;
bool percent = false;
bool dot = false;
bool afterEquals = false;
bool markEqualLock = false;

int iconColorDivision = Colors.white.value;
int iconColorMultiplication = Colors.white.value;
int iconColorMinus = Colors.white.value;
int iconColorAdd = Colors.white.value;
int colorDivision = 0xffF69906;
int colorMultiplication = 0xffF69906;
int colorMinus = 0xffF69906;
int colorAdd = 0xffF69906;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CalculatorTopScreen(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 65.0, top: 0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      //
                      //
                      //
                      FirstRow(
                        onTapAC: () {
                          percent = false;
                          dot = false;
                          afterEquals = false;
                          markEqualLock = false;
                          mainNumber = 0;
                          mark = 0;
                          finalMark = 0;
                          secondNumber = 0;
                          firstNumber = 0;
                          if (mainNumber != 0 &&
                              secondNumber != 0 &&
                              firstNumber != 0 &&
                              finalMark != 0 &&
                              mark == 0) {
                            acOrcText = 'C';
                          }
                          if (mainNumber == 0 &&
                              secondNumber == 0 &&
                              firstNumber == 0 &&
                              finalMark == 0 &&
                              mark == 0) {
                            acOrcText = 'AC';
                          }
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);

                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                          box.put('acOrcText', acOrcText);
                        },
                        //
                        //
                        //
                        onTapDivision: () {
                          if (markEqualLock == false) {
                            if (mark == 0 && finalMark > 0) {
                              secondNumber = mainNumber;
                              if (finalMark == 4) {
                                mainNumber = firstNumber / secondNumber;
                              }
                              if (finalMark == 3) {
                                mainNumber = firstNumber * secondNumber;
                              }
                              if (finalMark == 2) {
                                mainNumber = firstNumber - secondNumber;
                              }
                              if (finalMark == 1) {
                                mainNumber = firstNumber + secondNumber;
                              }
                            }
                          }
                          if (mark == 4 && finalMark == 4) {
                            mark = 0;
                          } else {
                            mark = 4;
                          }
                          firstNumber = mainNumber;
                          if (mark == 4) {
                            colorAdd = 0xffF69906;
                            colorDivision = 0xffffffff;
                            colorMinus = 0xffF69906;
                            colorMultiplication = 0xffF69906;

                            iconColorMinus = Colors.white.value;
                            iconColorMultiplication = Colors.white.value;
                            iconColorDivision = 0xffF69906;
                            iconColorAdd = Colors.white.value;
                          }
                          finalMark = mark * 1;
                          markEqualLock = false;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);

                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        onTapMinusPlus: () {
                          setState(() {
                            mainNumber = mainNumber * -1;
                          });
                        },
                        onTapPercent: () {
                          setState(() {
                            mainNumber = mainNumber / 100;

                            percent = true;
                          });
                        },
                        // acOrc: acOrcText,
                      ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      SecondRow(
                        onTap7: () => schema['numberTap'](7),
                        onTap8: () => schema['numberTap'](8),
                        onTap9: () => schema['numberTap'](9),
                        onTapMultiplication: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (markEqualLock == false) {
                            if (mark == 0 && finalMark > 0) {
                              secondNumber = mainNumber;
                              if (finalMark == 4) {
                                mainNumber = firstNumber / secondNumber;
                              }
                              if (finalMark == 3) {
                                mainNumber = firstNumber * secondNumber;
                              }
                              if (finalMark == 2) {
                                mainNumber = firstNumber - secondNumber;
                              }
                              if (finalMark == 1) {
                                mainNumber = firstNumber + secondNumber;
                              }
                            }
                          }
                          if (mark == 3 && finalMark == 3) {
                            mark = 0;
                          } else {
                            mark = 3;
                          }
                          firstNumber = mainNumber;

                          finalMark = mark * 1;
                          if (mark == 3) {
                            colorAdd = 0xffF69906;
                            colorDivision = 0xffF69906;
                            colorMinus = 0xffF69906;

                            colorMultiplication = Colors.white.value;
                            iconColorMinus = Colors.white.value;
                            iconColorMultiplication = 0xffF69906;
                            iconColorDivision = Colors.white.value;
                            iconColorAdd = Colors.white.value;
                          }
                          markEqualLock = false;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                      ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      ThirdRow(
                        ontap4: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber > 0.0) {
                            mainNumber = mainNumber * 10 + 4;
                          }
                          if (mainNumber < 0) {
                            mainNumber = mainNumber * 10 - 4;
                          }
                          if (mainNumber == 0.0) {
                            mainNumber = 4;
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0 + 4;
                          }
                          if (firstNumber != 0 && secondNumber != 0) {
                            mainNumber = 0 + 4;
                          }
                          afterEquals = false;
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        //
                        //
                        //
                        ontap5: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber > 0.0) {
                            mainNumber = mainNumber * 10 + 5;
                          }
                          if (mainNumber < 0) {
                            mainNumber = mainNumber * 10 - 5;
                          }
                          if (mainNumber == 0.0) {
                            mainNumber = 5;
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0 + 5;
                          }
                          if (afterEquals == true) {
                            mainNumber = 0 + 5;
                          }
                          afterEquals = false;
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        //
                        //
                        //
                        ontap6: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber > 0.0) {
                            mainNumber = mainNumber * 10 + 6;
                          }
                          if (mainNumber < 0) {
                            mainNumber = mainNumber * 10 - 6;
                          }
                          if (mainNumber == 0.0) {
                            mainNumber = 6;
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0 + 6;
                          }
                          if (afterEquals == true) {
                            mainNumber = 0 + 6;
                          }
                          afterEquals = false;
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        //
                        //
                        //
                        ontapMinus: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (markEqualLock == false) {
                            if (mark == 0 && finalMark > 0) {
                              secondNumber = mainNumber;
                              if (finalMark == 4) {
                                mainNumber = firstNumber / secondNumber;
                              }
                              if (finalMark == 3) {
                                mainNumber = firstNumber * secondNumber;
                              }
                              if (finalMark == 2) {
                                mainNumber = firstNumber - secondNumber;
                              }
                              if (finalMark == 1) {
                                mainNumber = firstNumber + secondNumber;
                              }
                            }
                          }
                          if (mark == 2 && finalMark == 2) {
                            mark = 0;
                          } else {
                            mark = 2;
                          }
                          firstNumber = mainNumber;

                          finalMark = mark * 1;
                          if (mark == 2) {
                            colorAdd = 0xffF69906;
                            colorDivision = 0xffF69906;
                            colorMinus = Colors.white.value;

                            colorMultiplication = 0xffF69906;
                            iconColorMultiplication = Colors.white.value;
                            iconColorMinus = 0xffF69906;
                            iconColorDivision = Colors.white.value;
                            iconColorAdd = Colors.white.value;
                          }
                          markEqualLock = false;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                      ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      FourthRow(
                        ontap1: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber > 0.0) {
                            mainNumber = mainNumber * 10 + 1;
                          }
                          if (mainNumber < 0) {
                            mainNumber = mainNumber * 10 - 1;
                          }
                          if (mainNumber == 0.0) {
                            mainNumber = 1;
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0 + 1;
                          }
                          if (afterEquals == true) {
                            mainNumber = 0 + 1;
                          }
                          afterEquals = false;
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        //
                        //
                        //
                        ontap3: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber > 0.0) {
                            mainNumber = mainNumber * 10 + 3;
                          }
                          if (mainNumber < 0) {
                            mainNumber = mainNumber * 10 - 3;
                          }
                          if (mainNumber == 0.0) {
                            mainNumber = 3;
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0 + 3;
                          }
                          if (afterEquals == true) {
                            mainNumber = 0 + 3;
                          }
                          afterEquals = false;
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        //
                        //
                        //
                        ontap2: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber > 0.0) {
                            mainNumber = mainNumber * 10 + 2;
                          }
                          if (mainNumber < 0) {
                            mainNumber = mainNumber * 10 - 2;
                          }
                          if (mainNumber == 0.0) {
                            mainNumber = 2;
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0 + 2;
                          }
                          if (afterEquals == true) {
                            mainNumber = 0 + 2;
                          }
                          afterEquals = false;
                          colorAdd = 0xffF69906;
                          colorDivision = 0xffF69906;
                          colorMinus = 0xffF69906;
                          colorMultiplication = 0xffF69906;

                          iconColorMinus = Colors.white.value;
                          iconColorMultiplication = Colors.white.value;
                          iconColorDivision = Colors.white.value;
                          iconColorAdd = Colors.white.value;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                        ontapAdd: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (markEqualLock == false) {
                            if (mark == 0 && finalMark > 0) {
                              secondNumber = mainNumber;
                              if (finalMark == 4) {
                                mainNumber = firstNumber / secondNumber;
                              }
                              if (finalMark == 3) {
                                mainNumber = firstNumber * secondNumber;
                              }
                              if (finalMark == 2) {
                                mainNumber = firstNumber - secondNumber;
                              }
                              if (finalMark == 1) {
                                mainNumber = firstNumber + secondNumber;
                              }
                            }
                          }

                          if (mark == 1 && finalMark == 1) {
                            mark = 0;
                          } else {
                            mark = 1;
                          }
                          firstNumber = mainNumber;

                          finalMark = mark * 1;
                          if (mark == 1) {
                            colorAdd = Colors.white.value;
                            colorDivision = 0xffF69906;
                            colorMinus = 0xffF69906;
                            colorMultiplication = 0xffF69906;
                            iconColorMultiplication = Colors.white.value;
                            iconColorAdd = 0xffF69906;
                            iconColorDivision = Colors.white.value;
                            iconColorMinus = Colors.white.value;
                          }
                          markEqualLock = false;
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                          box.put('colorDivision', colorDivision);
                          box.put('colorMinus', colorMinus);
                          box.put('colorMultiplication', colorMultiplication);

                          box.put('iconColorMinus', iconColorMinus);
                          box.put('iconColorMultiplication',
                              iconColorMultiplication);
                          box.put('iconColorDivision', iconColorDivision);
                          box.put('iconColorAdd', iconColorAdd);
                        },
                      ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      FifthRow(
                        ontap0: () {
                          Vibrate.feedback(FeedbackType.impact);
                          if (mainNumber != 0.0) {
                            mainNumber = mainNumber * 10;
                          }

                          if (mainNumber == 0.0) {
                            acOrcText = 'C';
                          }
                          if (mark > 0) {
                            mark = 0;
                            mainNumber = 0;
                          }
                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                          box.put('colorAdd', colorAdd);
                        },
                        ontapEqual: () {
                          Vibrate.feedback(FeedbackType.impact);

                          if (mark == 0 && finalMark > 0) {
                            secondNumber = mainNumber;
                            if (finalMark == 4) {
                              mainNumber = firstNumber / secondNumber;
                            }
                            if (finalMark == 3) {
                              mainNumber = firstNumber * secondNumber;
                            }
                            if (finalMark == 2) {
                              mainNumber = firstNumber - secondNumber;
                            }
                            if (finalMark == 1) {
                              mainNumber = firstNumber + secondNumber;
                            }
                          }
                          mark = 0;

                          afterEquals = true;
                          markEqualLock = true;

                          Box box = Hive.box('appbox');
                          box.put('main_number', mainNumber);
                        },
                        ontapPoint: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
                            dot = true;
                          });
                        },
                      ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //f
                      //
                      //
                    ],
                  ),
                ),
              ),
            ),
            flex: 8,
          ),
        ],
      ),
    );
  }
}
