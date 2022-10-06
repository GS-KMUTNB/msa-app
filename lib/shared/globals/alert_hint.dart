import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/theme/theme.dart';

class MsaHintAlert extends Container {
  MsaHintAlert({
    Key? key,
    required BuildContext context,
    required String title,
    double? width,
    double? height,
    bool ifPicture = false,
    bool haveButton = false,
    bool have2Button = false,
    bool haveCloseButton = false,
    bool continueButton = false,
    textContent = "",
    imageContent = "",
    subTextContent = "",
    numberQuestions = "",
    bool haveColorText = false,
    bool haveQuestions = false,
    bool warningQuestions = false,
    bool isHightRisk = false,
    VoidCallback? onContinue,
    VoidCallback? onPressedYes,
    VoidCallback? onPressedNo,
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
            title: haveCloseButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      msaSizeBox(width: 40),
                      Text(
                        title,
                        style: const TextStyle(color: whiteColor, fontSize: 24),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24.0,
                          ))
                    ],
                  )
                : Text(
                    title,
                    style: const TextStyle(color: whiteColor, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
            content: haveQuestions
                ? Column(
                    children: [
                      Text(
                        translate("alert_result.you_answered_yes"),
                        style: const TextStyle(color: whiteColor),
                        textAlign: TextAlign.left,
                      ),
                      msaSizeBox(height: 30),
                      warningQuestions
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isHightRisk
                                    ? const Icon(
                                        Icons.error_rounded,
                                        color: primaryColor4,
                                        size: 40,
                                      )
                                    : const SizedBox(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Text(
                                    numberQuestions,
                                    style: TextStyle(
                                      color: isHightRisk
                                          ? warningColor
                                          : whiteColor,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                                isHightRisk
                                    ? const Icon(
                                        Icons.error_rounded,
                                        color: primaryColor4,
                                        size: 40,
                                      )
                                    : const SizedBox(),
                              ],
                            )
                          : Text(
                              numberQuestions,
                              style: const TextStyle(
                                  color: whiteColor, fontSize: 36),
                            ),
                      msaSizeBox(height: 30),
                      Text(
                        textContent,
                        style: const TextStyle(color: whiteColor),
                      )
                    ],
                  )
                : ifPicture
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            msaSizeBox(height: 20),
                            haveColorText
                                ? RichText(
                                    text: const TextSpan(
                                      text:
                                          'Description : The screening can be viewed in sequence of numbers as follows.\n1. Choose an answer : In this screening, there are two possible answers: ',
                                      style: TextStyle(color: whiteColor),
                                      /*defining default style is optional */
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'yes and no.',
                                          style:
                                              TextStyle(color: primaryColor4),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n2. Once the answer has been selected, press the next button to do so. ',
                                          style: TextStyle(color: whiteColor),
                                        ),
                                        TextSpan(
                                          text: ' next screening',
                                          style: TextStyle(
                                            color: primaryColor4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(
                                    subTextContent,
                                    style: const TextStyle(color: whiteColor),
                                  )
                          ],
                        ),
                      )
                    : haveColorText
                        ? RichText(
                            text: TextSpan(
                              text: translate(
                                  "warning_page_start.text_would_you"),
                              style: const TextStyle(color: whiteColor),
                              /*defining default style is optional */
                              children: <TextSpan>[
                                TextSpan(
                                  text: translate(
                                      "warning_page_start.text_leave_the_screen"),
                                  style: const TextStyle(color: primaryColor4),
                                ),
                                TextSpan(
                                  text: translate(
                                      "warning_page_start.text_if_you_agree"),
                                  style: const TextStyle(color: whiteColor),
                                ),
                                TextSpan(
                                  text: translate(
                                      "warning_page_start.text_will_be_delete"),
                                  style: const TextStyle(
                                    color: primaryColor4,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            textContent,
                            style: const TextStyle(color: whiteColor),
                          ),
            actions: haveButton
                ? have2Button
                    ? <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: warningColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: onPressedYes,
                                  child: Text(
                                    translate("warning_page_start.button_yes"),
                                    style: const TextStyle(color: blackColor),
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
                                  child: Text(
                                    translate("warning_page_start.button_no"),
                                    style: const TextStyle(color: blackColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    : <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              decoration: const BoxDecoration(
                                color: primaryColor4,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: continueButton
                                  ? TextButton(
                                      // ignore: fixme
                                      //FIXME
                                      onPressed: onContinue,
                                      child: Text(
                                        translate(
                                            "warning_page_start.button_continue"),
                                        style:
                                            const TextStyle(color: blackColor),
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        translate(
                                            "warning_page_start.button_ok"),
                                        style:
                                            const TextStyle(color: blackColor),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ]
                : <Widget>[
                    const SizedBox(),
                  ],
          ),
        );
}
