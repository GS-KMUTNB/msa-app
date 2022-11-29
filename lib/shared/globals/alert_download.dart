import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class AlertDownload extends Container {
  AlertDownload({
    required BuildContext context,
    required bool isSuccessfully,
    VoidCallback? onPressedYes,
    VoidCallback? onPressedNo,
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
              "Download Result",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: isSuccessfully
                ? SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          color: whiteColor,
                          size: 100.0,
                        ),
                        msaSizeBox(height: 10),
                        const Text(
                          "Download successfully",
                          style: TextStyle(color: whiteColor),
                        ),
                        msaSizeBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              padding: const EdgeInsets.all(0),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:
                                      AssetImage("assets/images/pdf-icon.png"),
                                ),
                              ),
                            ),
                            msaSizeBox(width: 10),
                            const SizedBox(
                              width: 220,
                              child: Text(
                                "File : Result Energy & Protein Intake Calculator.pdf",
                                style: TextStyle(color: whiteColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 115,
                    child: Column(
                      children: [
                        const Text(
                          "You want to download Result Energy & Protein Intake Calculator",
                          style: TextStyle(color: whiteColor),
                        ),
                        msaSizeBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              padding: const EdgeInsets.all(0),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:
                                      AssetImage("assets/images/pdf-icon.png"),
                                ),
                              ),
                            ),
                            msaSizeBox(width: 10),
                            const SizedBox(
                              width: 220,
                              child: Text(
                                "File : Result Energy & Protein Intake Calculator.pdf",
                                style: TextStyle(color: whiteColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
            actions: isSuccessfully
                ? [msaSizeBox()]
                : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            color: primaryColor4,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed: onPressedYes,
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: blackColor),
                            ),
                          ),
                        ),
                        msaSizeBox(width: 15),
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            color: primaryColor4,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed:
                                onPressedNo, //() => Navigator.pop(context),
                            child: const Text(
                              "No",
                              style: TextStyle(color: blackColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
          ),
        );
}
