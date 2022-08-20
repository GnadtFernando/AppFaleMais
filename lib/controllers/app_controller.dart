import 'package:flutter/material.dart';

class AppController {
  TextEditingController minutesController = TextEditingController();
  String dropdownValue = '011';
  String dropdownValue2 = '011';
  String dropdownValue3 = 'FaleMais 30';
  late double percent;
  late double taxCorrection;
  late double finalPrice;

  calculate(int origin, int destiny, int duration) {
    double tax = 0.0;

    switch (origin) {
      case 11:
        switch (destiny) {
          case 16:
            tax = 1.9;
            print(duration * tax);
            break;
          case 17:
            tax = 1.7;
            print(duration * tax);
            break;
          case 18:
            tax = 0.9;
            print(duration * tax);
            break;
          default:
            print('erro');
        }
        break;
      case 16:
        switch (destiny) {
          case 11:
            tax = 2.9;
            print(duration * tax);
            break;
          default:
            print('erro');
        }
        break;
      case 17:
        switch (destiny) {
          case 11:
            tax = 2.7;
            print(duration * tax);
            break;
          default:
            print('erro');
        }
        break;
      case 18:
        switch (destiny) {
          case 11:
            tax = 1.9;
            print(duration * tax);
            break;
          default:
            print('erro');
        }
        break;
    }

    if (duration == 60) {
      print('Não paga nada');
    } else {
      int minExceed = duration - 120;
      percent = (10.0 / 100.0);
      taxCorrection = tax + (percent * tax);
      finalPrice = minExceed * taxCorrection;
      print(finalPrice);
    }
  }
}
