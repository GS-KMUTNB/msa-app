import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../shared.dart';

class ContainerDropdown extends Container {
  ContainerDropdown({
    Key? key,
    double? width,
    double? widthParenteral,
    double? widthSet,
    double? height,
    required String title1,
    required String title2,
    Color? colorContainer,
    Color? textColor,
    List<String>? list1,
    List<String>? list2,
    List<String>? list3,
    List<String>? list4,
    void Function(String?)? onChanged1,
    void Function(String?)? onChanged2,
    void Function(String?)? onChanged3,
    void Function(String?)? onChanged4,
    required bool isDropDown,
  }) : super(
          key: key,
          padding: const EdgeInsets.all(10),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                title1,
                minFontSize: 15,
                style: TextStyle(color: textColor),
              ),
              msaSizeBox(height: 5),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, top: 2),
                      decoration: const ShapeDecoration(
                          color: whiteColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          )),
                      width: widthParenteral,
                      child: DropDownForm(
                        onChanged: onChanged1,
                        v: list1,
                      )),
                  msaSizeBox(width: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    alignment: Alignment.centerLeft,
                    decoration: const ShapeDecoration(
                        color: whiteColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    width: widthSet,
                    height: isDropDown ? 42 : 42,
                    child: isDropDown
                        ? DropDownForm(
                            onChanged: onChanged2,
                            v: list2,
                          )
                        : const AutoSizeText(
                            "kCal",
                            minFontSize: 15,
                          ),
                  )
                ],
              ),
              msaSizeBox(height: 5),
              AutoSizeText(
                title2,
                minFontSize: 15,
                style: TextStyle(color: textColor),
              ),
              msaSizeBox(height: 5),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, top: 2),
                      decoration: const ShapeDecoration(
                          color: whiteColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          )),
                      width: widthParenteral,
                      child: DropDownForm(
                        onChanged: onChanged3,
                        v: list3,
                      )),
                  msaSizeBox(width: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    alignment: Alignment.centerLeft,
                    decoration: const ShapeDecoration(
                        color: whiteColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    width: widthSet,
                    height: isDropDown ? 42 : 42,
                    child: isDropDown
                        ? DropDownForm(
                            onChanged: onChanged4,
                            v: list4,
                          )
                        : const AutoSizeText(
                            "kCal",
                            minFontSize: 15,
                          ),
                  ),
                ],
              ),
            ],
          ),
        );
}
