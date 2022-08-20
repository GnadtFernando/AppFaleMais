import 'package:flutter/material.dart';

class AppController {
  TextEditingController minutesController = TextEditingController();
  String dropdownValue = '011';
  String dropdownValue2 = '011';
  String dropdownValue3 = 'Fale Mais 30';

  calculate(int origin, int destiny, int duration, int plan) {
    double tax = 0.0;

    switch (origin) {
      case 11:
        switch (destiny) {
          case 16:
            tax = 1.9;
            break;
          case 17:
            tax = 1.7;
            break;
          case 18:
            tax = 0.9;
        }
        break;
      case 16:
        switch (destiny) {
          case 11:
            tax = 2.9;
            break;
        }
        break;
      case 17:
        switch (destiny) {
          case 11:
            tax = 2.7;
            break;
        }
        break;

      case 18:
        switch (destiny) {
          case 11:
            tax = 1.9;
            break;
        }
        break;
    }
    if (duration <= plan) {
      print('Não paga nada');
    } else {
      print('tarifado');
    }
  }
}
