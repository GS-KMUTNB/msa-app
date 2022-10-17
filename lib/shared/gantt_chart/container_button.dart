import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../theme/theme.dart';
import '../shared.dart';

class ContainerOfButton extends Container {
  ContainerOfButton({
    Key? key,
    double? width,
    double? widthButton,
    required bool isAdd,
    required void Function() onPressedContinue,
    required void Function() onPressedCancel,
    required void Function() onPressedDelete,
  }) : super(
          key: key, padding: const EdgeInsets.all(20),
          width: width,
          // height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgGreyColor,
          ),
          child: Column(
            children: [
              MsaButton(
                w: widthButton,
                h: 40,
                text: translate("screening_results.button_continue"),
                textStyle: const TextStyle(color: whiteColor),
                color: primaryColor1,
                onPressed: onPressedContinue,
              ),
              msaSizeBox(height: 15),
              MsaButton(
                w: widthButton,
                h: 40,
                text: translate("warning_page_start.button_cancel"),
                textStyle: const TextStyle(color: Colors.grey),
                color: whiteColor,
                onPressed: onPressedCancel,
              ),
              msaSizeBox(height: 15),
              isAdd
                  ? const SizedBox()
                  : MsaButton(
                      w: widthButton,
                      h: 40,
                      text: translate("dialysis_todo.delete"),
                      textStyle: const TextStyle(color: blackColor),
                      color: primaryColor3,
                      onPressed: onPressedDelete,
                    ),
            ],
          ),
        );
}
