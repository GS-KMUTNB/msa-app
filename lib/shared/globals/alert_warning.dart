import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class AlertWarning extends Container {
  AlertWarning({
    required BuildContext context,
    VoidCallback? onPressedContinue,
    VoidCallback? onPressedForLater,
    Key? key,
  }) : super(
          key: key,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            key: key,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            backgroundColor: primaryColor1,
            title: const Text(
              "Warning",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor5,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SizedBox(
              height: 190,
              child: Column(
                children: [
                  const Text(
                    "!!You are at high risk!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: warningColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  msaSizeBox(height: 20),
                  const Text(
                    "Should you continue your nutritional assessment? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  const Text(
                    "Consult a dietitian/nutrition team",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  msaSizeBox(height: 20),
                  const Text(
                    " Will you continue the nutritional assessment?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                width: 100,
                decoration: const BoxDecoration(
                  color: primaryColor4,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextButton(
                  onPressed: onPressedContinue,
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: blackColor),
                  ),
                ),
              ),
              msaSizeBox(width: 10),
              Container(
                width: 100,
                decoration: const BoxDecoration(
                  color: primaryColor4,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextButton(
                  onPressed: onPressedForLater, //() => Navigator.pop(context),
                  child: const Text(
                    "For later",
                    style: TextStyle(color: blackColor),
                  ),
                ),
              ),
            ],
          ),
        );
}
