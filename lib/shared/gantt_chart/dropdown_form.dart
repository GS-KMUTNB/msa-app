import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class DropDownForm extends DropdownButtonFormField<String> {
  DropDownForm({
    Key? key,
    required List<String>? v,
    required void Function(String?)? onChanged,
  }) : super(
          key: key,
          value: v?.first,
          decoration: const InputDecoration.collapsed(hintText: ''),
          isExpanded: true,
          iconEnabledColor: Colors.grey,
          iconSize: 30,
          validator: (value) => value == v?.first ? 'field required' : null,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          items: v?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: onChanged,
        );
}

class DisplayResultStep extends Column {
  DisplayResultStep({
    Key? key,
    required double width,
    required String bmi,
    required String ibw,
  }) : super(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Case Information',
              minFontSize: 16,
              maxLines: 1,
            ),
            const AutoSizeText(
              'your result is',
              minFontSize: 8,
              maxLines: 1,
            ),
            msaSizeBox(height: 10),
            Row(
              children: [
                const AutoSizeText(
                  "BMI",
                  maxLines: 1,
                  minFontSize: 16,
                  maxFontSize: 18,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  width: width / 1.95,
                  height: 40,
                  decoration: const ShapeDecoration(
                      color: primaryColor4,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      )),
                  child: AutoSizeText(
                    bmi,
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
            msaSizeBox(height: 10),
            Row(
              children: [
                const AutoSizeText(
                  "IBW",
                  maxLines: 1,
                  minFontSize: 16,
                  maxFontSize: 18,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  width: width / 1.95,
                  height: 40,
                  decoration: const ShapeDecoration(
                      color: primaryColor4,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      )),
                  child: AutoSizeText(
                    ibw,
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            )
          ],
        );
}

double calculateIBW(double height, String sex) {
  var ideal = 0;
  if (sex == "Male") {
    ideal = 100;
  } else {
    ideal = 105;
  }
  var ibw = height - ideal;

  return ibw;
}






// import 'package:flutter/material.dart';

// class FormValidationWithDropdown extends StatefulWidget {
//   const FormValidationWithDropdown({Key? key}) : super(key: key);

//   @override
//   FormValidationWithDropdownState createState() =>
//       FormValidationWithDropdownState();
// }

// class FormValidationWithDropdownState
//     extends State<FormValidationWithDropdown> {
//   final _formKey = GlobalKey<FormState>();
//   String selectedSalutation = "";
//   String name = "";

//   @override
//   Widget build(BuildContext context) {
//     const List<String> sex = <String>['Please select', 'Male', 'Female'];
    // const List<String> energy = <String>[
    //   'Please select',
    //   '20',
    //   '25',
    //   '30',
    //   '35',
    //   '40'
    // ];
    // const List<String> protien = <String>[
    //   'Please select',
    //   '1.0',
    //   '1.2',
    //   '1.3',
    //   '1.4',
    //   '1.5'
    // ];

//     String sexValue = sex.first;
    // String energyValue = energy.first;
    // String protienValue = protien.first;

//     return 
//     Form(
//       key: _formKey,
//       autovalidateMode: AutovalidateMode.always,
//       child: DropdownButtonFormField<String>(
//           value: sexValue,
//           decoration: const InputDecoration.collapsed(hintText: ''),
//           isExpanded: true,
//           iconEnabledColor: Colors.grey,
//           iconSize: 30,
//           borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//           items: sex.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(value: value, child: Text(value));
//           }).toList(),
//           onChanged: (String? value) {
            // setState(() {
            //   sexValue = value!;
            //   print(value);
            // });
//           }),
//     );
//   }
// }
