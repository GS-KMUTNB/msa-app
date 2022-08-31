import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class CardLanguageScreen extends Container {
  CardLanguageScreen({
    Key? key,
    double minFontSizeHeader = 12,
    double minFontSizeContent = 12,
    required double w,
    required double h,
    required Color color,
    required VoidCallback thaiButton,
    required VoidCallback engButton,
  }) : super(
          key: key,
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: primaryColor4,
            borderRadius: BorderRadius.circular(30),
            // border: Border.all(color: Colors.black),
            boxShadow: const [
              BoxShadow(
                blurRadius: 0.5,
                offset: Offset(3, 3),
              ), //BoxShadow
              BoxShadow(
                color: primaryColor1,
                blurRadius: 0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 280,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(color),
                    ),
                    onPressed: engButton,
                    child: Text(
                      "English",
                      style: head3,
                    ),
                  ),
                ),
                msaSizeBox(height: 40),
                SizedBox(
                  width: 280,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(color),
                    ),
                    onPressed: thaiButton,
                    child: Text(
                      "Thai",
                      style: head3,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}
