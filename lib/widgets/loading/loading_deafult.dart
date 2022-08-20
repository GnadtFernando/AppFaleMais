import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingDefault {
  static showLoading() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      indicator: SizedBox(
        child: Row(
          children: const [
            SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Calculando...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static closeLoading() {
    EasyLoading.dismiss();
  }
}
