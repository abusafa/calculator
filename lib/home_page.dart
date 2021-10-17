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
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

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

Color iconColorDivision = Colors.white;
Color iconColorMultiplication = Colors.white;
Color iconColorMinus = Colors.white;
Color iconColorAdd = Colors.white;
Color colorDivision = Color(0xffF69906);
Color colorMultiplication = Color(0xffF69906);
Color colorMinus = Color(0xffF69906);
Color colorAdd = Color(0xffF69906);

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
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        onTapDivision: () {
                          setState(() {
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
                              colorAdd = Color(0xffF69906);
                              colorDivision = Colors.white;
                              colorMinus = Color(0xffF69906);
                              colorMultiplication = Color(0xffF69906);

                              iconColorMinus = Colors.white;
                              iconColorMultiplication = Colors.white;
                              iconColorDivision = Color(0xffF69906);
                              iconColorAdd = Colors.white;
                            }
                            finalMark = mark * 1;
                            markEqualLock = false;
                          });
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
                        acOrc: acOrcText,
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
                        onTap7: () {
                          //  Vibrate.vibrate();
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
                            if (mainNumber > 0.0) {
                              mainNumber = mainNumber * 10 + 7;
                            }
                            if (mainNumber < 0) {
                              mainNumber = mainNumber * 10 - 7;
                            }
                            if (mainNumber == 0.0) {
                              mainNumber = 7;
                              acOrcText = 'C';
                            }
                            if (mark > 0 && finalMark > 0) {
                              mark = 0;
                              mainNumber = 0 + 7;
                            }
                            // if (firstNumber != 0 && secondNumber != 0) {
                            //   mainNumber = 0 + 7;
                            // }
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                            if (afterEquals == true) {
                              mainNumber = 0 + 7;
                            }
                            afterEquals = false;
                          });
                        },
                        //
                        //
                        //
                        onTap8: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
                            if (mainNumber > 0.0) {
                              mainNumber = mainNumber * 10 + 8;
                            }
                            if (mainNumber < 0) {
                              mainNumber = mainNumber * 10 - 8;
                            }
                            if (mainNumber == 0.0) {
                              mainNumber = 8;
                              acOrcText = 'C';
                            }
                            if (mark > 0) {
                              mark = 0;
                              mainNumber = 0 + 8;
                            }
                            if (afterEquals == true) {
                              mainNumber = 0 + 8;
                            }
                            afterEquals = false;
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        onTap9: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
                            if (mainNumber > 0.0) {
                              mainNumber = mainNumber * 10 + 9;
                            }
                            if (mainNumber < 0) {
                              mainNumber = mainNumber * 10 - 9;
                            }
                            if (mainNumber == 0.0) {
                              mainNumber = 9;
                              acOrcText = 'C';
                            }
                            if (mark > 0) {
                              mark = 0;
                              mainNumber = 0 + 9;
                            }
                            if (afterEquals == true) {
                              mainNumber = 0 + 9;
                            }
                            afterEquals = false;
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        onTapMultiplication: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                              colorAdd = Color(0xffF69906);
                              colorDivision = Color(0xffF69906);
                              colorMinus = Color(0xffF69906);

                              colorMultiplication = Colors.white;
                              iconColorMinus = Colors.white;
                              iconColorMultiplication = Color(0xffF69906);
                              iconColorDivision = Colors.white;
                              iconColorAdd = Colors.white;
                            }
                            markEqualLock = false;
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
                      //
                      //
                      //
                      ThirdRow(
                        ontap4: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        ontap5: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        ontap6: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        ontapMinus: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                              colorAdd = Color(0xffF69906);
                              colorDivision = Color(0xffF69906);
                              colorMinus = Colors.white;

                              colorMultiplication = Color(0xffF69906);
                              iconColorMultiplication = Colors.white;
                              iconColorMinus = Color(0xffF69906);
                              iconColorDivision = Colors.white;
                              iconColorAdd = Colors.white;
                            }
                            markEqualLock = false;
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
                      //
                      //
                      //
                      FourthRow(
                        ontap1: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        ontap3: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        //
                        //
                        //
                        ontap2: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                            colorAdd = Color(0xffF69906);
                            colorDivision = Color(0xffF69906);
                            colorMinus = Color(0xffF69906);
                            colorMultiplication = Color(0xffF69906);

                            iconColorMinus = Colors.white;
                            iconColorMultiplication = Colors.white;
                            iconColorDivision = Colors.white;
                            iconColorAdd = Colors.white;
                          });
                        },
                        ontapAdd: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                              colorAdd = Colors.white;
                              colorDivision = Color(0xffF69906);
                              colorMinus = Color(0xffF69906);
                              colorMultiplication = Color(0xffF69906);
                              iconColorMultiplication = Colors.white;
                              iconColorAdd = Color(0xffF69906);
                              iconColorDivision = Colors.white;
                              iconColorMinus = Colors.white;
                            }
                            markEqualLock = false;
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
                      //
                      //
                      //
                      FifthRow(
                        ontap0: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                          });
                        },
                        ontapEqual: () {
                          Vibrate.feedback(FeedbackType.impact);
                          setState(() {
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
                          });
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
