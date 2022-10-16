import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../shared.dart';

class ContainerOfButton extends Container {
  ContainerOfButton({
    Key? key,
    double? width,
    double? widthButton,
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
                text: "Continue",
                textStyle: const TextStyle(color: whiteColor),
                color: primaryColor1,
                onPressed: onPressedContinue,
              ),
              msaSizeBox(height: 15),
              MsaButton(
                w: widthButton,
                h: 40,
                text: "Cancel",
                textStyle: const TextStyle(color: Colors.grey),
                color: whiteColor,
                onPressed: onPressedCancel,
              ),
              msaSizeBox(height: 15),
              MsaButton(
                w: widthButton,
                h: 40,
                text: "Delete",
                textStyle: const TextStyle(color: blackColor),
                color: primaryColor3,
                onPressed: onPressedDelete,
              ),
            ],
          ),
        );
}
