import 'package:flutter/material.dart';
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
    VoidCallback? onContinue,
    VoidCallback? onPressedYes,
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
                      const Text(
                        "You answered yes ",
                        style: TextStyle(color: whiteColor),
                        textAlign: TextAlign.left,
                      ),
                      msaSizeBox(height: 30),
                      warningQuestions
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.error_rounded,
                                  color: primaryColor4,
                                  size: 40,
                                ),
                                Text(
                                  numberQuestions,
                                  style: const TextStyle(
                                      color: primaryColor4, fontSize: 32),
                                ),
                                const Icon(
                                  Icons.error_rounded,
                                  color: primaryColor4,
                                  size: 40,
                                ),
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
                            text: const TextSpan(
                              text: 'Would you like to',
                              style: TextStyle(color: whiteColor),
                              /*defining default style is optional */
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' leave the screening form?',
                                  style: TextStyle(color: primaryColor4),
                                ),
                                TextSpan(
                                  text:
                                      ' \nIf you agree to leave the screening form',
                                  style: TextStyle(color: whiteColor),
                                ),
                                TextSpan(
                                  text:
                                      ' Everything you do in this assessment will be deleted.',
                                  style: TextStyle(
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
                                  child: const Text(
                                    'Yes',
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
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(color: blackColor),
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
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(color: blackColor),
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: blackColor),
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
