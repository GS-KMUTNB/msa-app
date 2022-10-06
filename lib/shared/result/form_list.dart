import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/shared/shared.dart';

import '../../theme/theme.dart';

class FormListResult extends Container {
  FormListResult({
    Key? key,
    required String qustion,
    required String answer,
    required int index,
  }) : super(
            key: key,
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  child: ListTile(
                    leading: SizedBox(
                      width: 38,
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
                    buttonLables: [
                      translate("assesment_page.table_head_yes"),
                      translate("assesment_page.table_head_no")
                    ],
                    buttonValues: [
                      translate("assesment_page.table_head_yes"),
                      translate("assesment_page.table_head_no")
                    ],
                    selectedColor: colorCondition(answer),
                    unSelectedBorderColor: const Color.fromARGB(73, 0, 0, 0),
                    radioButtonValue: (value) => {},
                  ),
                ),
              ],
            ));
}
