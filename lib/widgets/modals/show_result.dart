import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalTextResult {
  static showModal(context, String withoutPlanText, String withPlanText) {
    Size size = MediaQuery.of(context).size;
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Center(
            child: Container(
              width: size.width * 0.84,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.02),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Veja como fica o valor sem o plano:',
                      style: TextStyle(fontSize: size.width * 0.048),
                    ),
                    Text(withoutPlanText),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      'Veja como fica o valor sem o plano:',
                      style: TextStyle(fontSize: size.width * 0.048),
                    ),
                    Text(withPlanText),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
