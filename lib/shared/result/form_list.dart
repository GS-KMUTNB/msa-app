import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class FormListResult extends Container {
  FormListResult({
    Key? key,
    required String qustion,
    required String answer,
    required int index,
  }) : super(
            key: key,
            child: SizedBox(
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      leading: SizedBox(
                        width: 40,
                        child: MaterialButton(
                          onPressed: () {},
                          color: primaryColor,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          shape: const CircleBorder(),
                          child: Text("$index"),
                        ),
                      ),
                      title: AutoSizeText(
                        qustion,
                        maxLines: 2,
                        minFontSize: 10,
                      ),
                    ),
                  ),
                  AbsorbPointer(
                    absorbing: true,
                    child: CustomRadioButton(
                      defaultSelected: answer,
                      elevation: 0,
                      absoluteZeroSpacing: true,
                      unSelectedColor: Colors.transparent,
                      buttonLables: const ["Yes", "No"],
                      buttonValues: const ["Yes", "No"],
                      selectedColor: Colors.green,
                      unSelectedBorderColor: const Color.fromARGB(73, 0, 0, 0),
                      radioButtonValue: (value) => {},
                    ),
                  ),
                ],
              ),
            ));
}
