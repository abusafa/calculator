// ignore_for_file: prefer_const_constructors

// import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalculatorTopScreen extends StatelessWidget {
  const CalculatorTopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('appbox').listenable(),
        builder: (context, Box box, widget) {
          dynamic mainNumber = box.get('main_number');
          return Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text(
                  //   '$markEqualLock',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   '$afterEquals',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   '$firstNumber',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   '$secondNumber',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   '$mark',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   '$finalMark',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 0),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  "$mainNumber",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            flex: 5,
          );
        });
  }
}
