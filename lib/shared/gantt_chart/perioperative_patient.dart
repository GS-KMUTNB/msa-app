import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/shared/shared.dart';

import '../../theme/theme.dart';
import '../globals/alert_hint.dart';

class PerioperativePatientScreen extends StatefulWidget {
  const PerioperativePatientScreen({
    Key? key,
    BuildContext? context,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  State<PerioperativePatientScreen> createState() =>
      _PerioperativePatientScreen();
}

class _PerioperativePatientScreen extends State<PerioperativePatientScreen> {
  late TextEditingController weightController = TextEditingController();
  final FocusNode weightFocus = FocusNode();

  late TextEditingController heightController = TextEditingController();
  final FocusNode hightFocus = FocusNode();

  final _controller = ScrollController();
  // final _formKey = GlobalKey<FormState>();
  // int _index = 0;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    const List<String> sex = <String>['Please select', 'Male', 'Female'];
    const List<String> energy = <String>[
      'Please select',
      '20',
      '25',
      '30',
      '35',
      '40'
    ];
    const List<String> protien = <String>[
      'Please select',
      '1.0',
      '1.2',
      '1.3',
      '1.4',
      '1.5'
    ];

    String sexValue = sex.first;
    String energyValue = energy.first;
    String protienValue = protien.first;

    var getStep = <Step>[
      Step(
          title: const AutoSizeText(
            'Case Information',
            minFontSize: 16,
            maxLines: 1,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Sex",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: sexValue,
                      items: sex.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          sexValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Height",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Width",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(height: 10),
                Row(
                  // Dashed line
                  children: [
                    for (int i = 0; i < width / 8.5; i++)
                      Container(
                        width: 5,
                        height: 1,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: i % 2 == 0
                                  ? const Color.fromRGBO(214, 211, 211, 1)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                  ],
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          )),
                      child: const AutoSizeText(
                        "17.18 kg./m^2",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          )),
                      child: const AutoSizeText(
                        "17.18 kg./m^2",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
      Step(
          title: const AutoSizeText(
            'Daily Requirement',
            minFontSize: 16,
            maxLines: 1,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Energy goal (kcal/kg/day)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: energyValue,
                      items:
                          energy.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          energyValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Protien goal (g/kg/day)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: protienValue,
                      items:
                          protien.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          protienValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Energy daily requirement (kcal)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  width: width,
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
                  child: const AutoSizeText(
                    "1,250 (kcal)",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Protein daily requirement (g)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  width: width,
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
                  child: const AutoSizeText(
                    "60.0 (g)",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Actual Oral/EN energy intake (kcal)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "% actual energy intake vs requirement",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  width: width,
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
                  child: const AutoSizeText(
                    "56.0 %",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )),
    ];

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        title: 'GANTT CHART Energy & Protein Intake Calculator',
        maxLines: 2,
        ctx: context,
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            ifPicture: false,
            haveButton: true,
            have2Button: true,
            haveColorText: true,
            haveQuestions: false,
            title: 'Warning!!!',
            width: width,
            height: height / 2,
            onPressedYes: () {
              Navigator.of(context)
                ..pop()
                ..pop();
            },
            onPressedNo: () {
              Navigator.pop(context);
            },
          ),
        ),
        onPressedHint: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            ifPicture: true,
            haveButton: false,
            haveColorText: false,
            haveQuestions: false,
            haveCloseButton: true,
            title: 'User Manual',
            subTextContent:
                "Description : Nutritional status screening page \n1. progress tube is a tube that indicates the status of the nutritional status screening.\n2. Calculate BMI, enter weight and height, then enter confirmation to calculate BMI.\n3. There are four screening topics, each with a yes and no answer.",
            height: height / 2,
            width: width,
          ),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: CardContent(
                w: width - 40,
                h: height / 1.20,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          controller: _controller,
                          children: [
                            MsaStepper(
                              context: context,
                              currentStep: 0, //_index,
                              onStepCancel: () {},
                              onStepContinue: () {},
                              onStepTapped: (int index) => null,
                              steps: getStep,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
