import 'package:dev_fale_mais/widgets/loading/loading_deafult.dart';
import 'package:flutter/material.dart';

class AppController {
  TextEditingController minutesController = TextEditingController();
  String dropdownValue = '011';
  String dropdownValue2 = '011';
  String dropdownValue3 = 'FaleMais 30';
  late double percent;
  late double taxCorrection;
  double finalPrice = 0;
  int plan = 0;
  double tax = 0.0;
  int duration = 0;
  double withoutPlan = 0;
  double noCombination = 0;

  convertPlan() {
    if (dropdownValue3 == 'FaleMais 30') {
      plan = 30;
    } else {
      if (dropdownValue3 == 'FaleMais 60') {
        plan = 60;
      } else if (dropdownValue3 == 'FaleMais 120') {
        plan = 120;
      } else {
        return null;
      }
    }
  }

  calculate(
    int origin,
    int destiny,
    int duration,
  ) {
    LoadingDefault.showLoading();
    switch (origin) {
      case 11:
        switch (destiny) {
          case 16:
            tax = 1.90;
            withoutPlan = duration * tax;
            LoadingDefault.closeLoading();
            break;
          case 17:
            tax = 1.7;
            duration * tax;
            withoutPlan = duration * tax;
            LoadingDefault.closeLoading();
            break;
          case 18:
            tax = 0.9;
            duration * tax;
            withoutPlan = duration * tax;
            LoadingDefault.closeLoading();
            break;
          default:
            return noCombination = -1;
        }
        break;
      case 16:
        switch (destiny) {
          case 11:
            tax = 2.9;
            duration * tax;
            withoutPlan = duration * tax;
            LoadingDefault.closeLoading();
            break;
          default:
            return noCombination = -1;
        }
        break;
      case 17:
        switch (destiny) {
          case 11:
            tax = 2.7;
            duration * tax;
            withoutPlan = duration * tax;
            LoadingDefault.closeLoading();
            break;
          default:
            return noCombination = -1;
        }
        break;
      case 18:
        switch (destiny) {
          case 11:
            tax = 1.9;
            duration * tax;
            withoutPlan = duration * tax;
            LoadingDefault.closeLoading();
            break;
          default:
            return noCombination = -1;
        }
        LoadingDefault.closeLoading();
        break;
    }
    convertPlan();
    if (duration <= plan) {
      finalPrice = 0;
    } else {
      num minExceed = duration - plan;
      percent = (10.0 / 100.0);
      taxCorrection = tax + (percent * tax);
      finalPrice = minExceed * taxCorrection;
    }
  }
}
