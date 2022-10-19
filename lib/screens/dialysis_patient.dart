// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_translate/flutter_translate.dart';
// import 'package:intl/intl.dart';

// import '../../theme/theme.dart';
// import '../shared/shared.dart';
// import 'screens.dart';

// class DialysisPatientScreen extends StatefulWidget {
//   const DialysisPatientScreen({
//     Key? key,
//     BuildContext? context,
//     required BuildContext buildContext,
//   }) : super(key: key);

//   @override
//   State<DialysisPatientScreen> createState() => _DialysisPatientScreen();
// }

// class _DialysisPatientScreen extends State<DialysisPatientScreen> {
//   final TextEditingController weightController = TextEditingController();
//   final TextEditingController heightController = TextEditingController();
//   final TextEditingController egfrController = TextEditingController();
//   final TextEditingController energyController = TextEditingController();
//   final TextEditingController proteinController = TextEditingController();
//   final TextEditingController albuminController = TextEditingController();

//   final TextEditingController prealbuminController = TextEditingController();
//   final TextEditingController interventionController = TextEditingController();
//   final TextEditingController followUpActualController =
//       TextEditingController();
//   final TextEditingController albuminFollowUpController =
//       TextEditingController();
//   final TextEditingController prealbuminFollowUpController =
//       TextEditingController();

//   final FocusNode weightFocus = FocusNode();
//   final FocusNode heightFocus = FocusNode();
//   final FocusNode egfrFocus = FocusNode();
//   final FocusNode energyFocus = FocusNode();
//   final FocusNode proteinFocus = FocusNode();
//   final FocusNode albuminFocus = FocusNode();
//   final FocusNode prealbuminFocus = FocusNode();
//   final FocusNode interventionFocus = FocusNode();
//   final FocusNode followUpActualFocus = FocusNode();
//   final FocusNode albuminFollowUpFocus = FocusNode();
//   final FocusNode prealbuminFollowUpFocus = FocusNode();

//   bool haveBMIValue = false;
//   bool haveCase2Value = false;
//   bool haveNutritionValue = false;
//   bool haveFollowUpValue = false;

//   late String bmiValue,
//       ibwValue,
//       resultBmi,
//       wValue,
//       hValue,
//       sexValue,
//       egfrValue,
//       ckdValue,
//       renalValue,
//       aeValue,
//       edValue,
//       pdValue,
//       energyGoalValue,
//       protienGoalValue,
//       edResult,
//       pdResult,
//       edReqResult,
//       pdReqResult,
//       albuminValue,
//       prealbuminValue,
//       followUpValue,
//       diffBodyWeightValue,
//       diffAlbuminValue,
//       diffPrealbuminValue,
//       interventionValue,
//       followUpActualValue,
//       albuminFollowUpValue,
//       prealbuminFollowUpValue,
//       heightValue,
//       weightValue;

//   late String albuminResult, prealbuminResult, interventionResult;

//   late double ibw;

//   final _fkDp1 = GlobalKey<FormState>();
//   final _fkDp2 = GlobalKey<FormState>();
//   final _fkDp3 = GlobalKey<FormState>();
//   final _fkDp4 = GlobalKey<FormState>();

//   final formatter = NumberFormat.decimalPattern();

//   int _index = 0;

//   List<String> sex = <String>[
//     translate("gantt_chart.perio_page.select_sex"),
//     translate("gantt_chart.perio_page.male"),
//     translate("gantt_chart.perio_page.female"),
//   ];

//   List<String> ckdStage = <String>[
//     translate("gantt_chart.perio_page.select_sex"),
//     'CKD Stage',
//     'No CKD',
//     '1',
//     '2',
//     '3A',
//     '3B',
//     '4',
//     'ERSD'
//   ];

//   List<String> energyGoal = <String>[
//     translate("gantt_chart.perio_page.select_sex"),
//     '25',
//     '30',
//     '35',
//   ];

//   List<String> protienGoal = <String>[
//     translate("gantt_chart.perio_page.select_sex"),
//     '0.6',
//     '0.7',
//     '0.8',
//     '0.9',
//     '1',
//     '1.1',
//     '1.2'
//   ];

//   List<String> renalReplacement = <String>[
//     translate("gantt_chart.perio_page.select_sex"),
//     translate("gantt_chart.dialysis_page.peritoneal"),
//     translate("assesment_page.table_head_no"),
//     translate("gantt_chart.dialysis_page.hemo"),
//     translate("gantt_chart.dialysis_page.peritoneal"),
//     translate("gantt_chart.dialysis_page.transplantation"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     var getStep = <Step>[
//       Step(
//         isActive: true,
//         title: haveBMIValue
//             ? DisplayResultStep(
//                 type: "case_infomation_1",
//                 width: width,
//                 bmi: bmiValue,
//                 ibw: ibwValue,
//                 sex: sexValue,
//                 eGFR: egfrValue,
//                 cdkStage: ckdValue,
//                 renal: renalValue,
//               )
//             : AutoSizeText(
//                 translate("gantt_chart.dialysis_page.title_1"),
//                 minFontSize: 16,
//                 maxLines: 1,
//               ),
//         content: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Form(
//                 key: _fkDp1,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeText(
//                       translate("gantt_chart.sex"),
//                       minFontSize: 14,
//                       maxLines: 1,
//                     ),
//                     msaSizeBox(),
//                     Container(
//                         padding: const EdgeInsets.only(left: 10, top: 2),
//                         decoration: const ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: 1.0,
//                             style: BorderStyle.solid,
//                             color: Colors.grey,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                         )),
//                         width: width,
//                         child: DropDownForm(
//                           onChanged: (String? v) {
//                             setState(() {
//                               sexValue = v!;
//                             });
//                           },
//                           v: sex,
//                         )),
//                     BmiForm(
//                       isGanttChart: true,
//                       heightController: heightController,
//                       hightFocus: heightFocus,
//                       weightController: weightController,
//                       weightFocus: weightFocus,
//                       onWeightChanged: (v) {
//                         setState(() {
//                           wValue = weightController.text;
//                         });
//                       },
//                       onHeightChanged: (v) {
//                         setState(() {
//                           hValue = heightController.text;
//                         });
//                       },
//                       inputFormattersWeight: [
//                         FilteringTextInputFormatter.allow(numberRegExp)
//                       ],
//                       validatorWeight: (String? val) {
//                         if (val == null || val.isEmpty) {
//                           return translate("validate.empty");
//                         }
//                         return null;
//                       },
//                       inputFormattersHeight: [
//                         FilteringTextInputFormatter.allow(numberRegExp)
//                       ],
//                       validatorHeight: (String? val) {
//                         if (val == null || val.isEmpty) {
//                           return translate("validate.empty");
//                         }
//                         return null;
//                       },
//                     ),
//                     msaSizeBox(height: 20),
//                     Row(
//                       children: [
//                         for (int i = 0; i < width / 8.5; i++)
//                           Container(
//                             width: 5,
//                             height: 1,
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 bottom: BorderSide(
//                                   width: 1,
//                                   color: i % 2 == 0
//                                       ? const Color.fromRGBO(214, 211, 211, 1)
//                                       : Colors.transparent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     msaSizeBox(height: 10),
//                     AutoSizeText(
//                       translate("gantt_chart.dialysis_page.eGFR"),
//                       minFontSize: 14,
//                       maxLines: 1,
//                     ),
//                     MsaFormField(
//                       controller: egfrController,
//                       controllerFocus: egfrFocus,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.allow(numberRegExp)
//                       ],
//                       hint: 'Please fill infomation',
                      // onChanged: (v) {
                      //   setState(() {
                      //     egfrValue = egfrController.text;
                      //   });
                      // },
                      // validator: (String? v) {
                      //   if (v == null || v.isEmpty) {
                      //     return 'Cannot empty';
                      //   }
                      //   return null;
                      // },
//                     ),
//                     msaSizeBox(),
//                     AutoSizeText(
//                       translate("gantt_chart.dialysis_page.ckd_stage"),
//                       // "osuahdo",
//                       minFontSize: 14,
//                       maxLines: 1,
//                     ),
//                     Container(
//                         padding: const EdgeInsets.only(left: 10, top: 2),
//                         decoration: const ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: 1.0,
//                             style: BorderStyle.solid,
//                             color: Colors.grey,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                         )),
//                         width: width,
//                         child: DropDownForm(
                          // onChanged: (String? v) {
                          //   setState(() {
                          //     ckdValue = v!;
                          //   });
                          // },
                          // v: ckdStage,
//                         )),
//                     msaSizeBox(height: 10),
//                     AutoSizeText(
//                       translate("gantt_chart.dialysis_page.renal_replacement"),
//                       minFontSize: 14,
//                       maxLines: 1,
//                     ),
//                     Container(
//                         padding: const EdgeInsets.only(left: 10, top: 2),
//                         decoration: const ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: 1.0,
//                             style: BorderStyle.solid,
//                             color: Colors.grey,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                         )),
//                         width: width,
//                         child: DropDownForm(
                          // onChanged: (String? v) {
                          //   setState(() {
                          //     renalValue = v!;
                          //   });
                          // },
                          // v: renalReplacement,
//                         )),
//                     msaSizeBox(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Step(
//         isActive: (_index >= 1) ? true : false,
//         title: haveCase2Value
//             ? DisplayResultStep(
//                 type: "case_infomation_2",
//                 width: width,
//                 energy: edResult,
//                 energyReq: edReqResult,
//                 protein: pdResult,
//                 proteinReq: pdReqResult,
//               )
//             : AutoSizeText(
//                 translate("gantt_chart.dialysis_page.title_2"),
//                 minFontSize: 16,
//                 maxLines: 1,
//               ),
//         content: Form(
//           key: _fkDp2,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AutoSizeText(
//                   translate("gantt_chart.dialysis_page.energy_daily"),
//                   minFontSize: 14,
//                   maxLines: 1,
//                 ),
//                 MsaFormField(
//                   controller: energyController,
//                   controllerFocus: energyFocus,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(numberRegExp)
//                   ],
//                   hint: translate("gantt_chart.fill_info"),
//                   onChanged: (v) {
//                     setState(() {
//                       edValue = energyController.text;
//                     });
//                   },
//                   validator: (String? v) {
//                     if (v == null || v.isEmpty) {
//                       return 'Cannot empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 AutoSizeText(
//                   translate("gantt_chart.dialysis_page.protein_daily"),
//                   minFontSize: 14,
//                   maxLines: 1,
//                 ),
//                 MsaFormField(
//                   controller: proteinController,
//                   controllerFocus: proteinFocus,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(numberRegExp)
//                   ],
//                   hint: translate("gantt_chart.fill_info"),
//                   onChanged: (v) {
//                     setState(() {
//                       pdValue = proteinController.text;
//                     });
//                   },
//                   validator: (String? v) {
//                     if (v == null || v.isEmpty) {
//                       return 'Cannot empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 AutoSizeText(
//                   translate("gantt_chart.dialysis_page.energy_intake"),
//                   minFontSize: 14,
//                   maxLines: 1,
//                 ),
//                 msaSizeBox(),
//                 Container(
//                     padding: const EdgeInsets.only(left: 10, top: 2),
//                     decoration: const ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                         color: Colors.grey,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     )),
//                     width: width,
//                     child: DropDownForm(
//                       onChanged: (String? v) {
//                         setState(() {
//                           energyGoalValue = v!;
//                         });
//                       },
//                       v: energyGoal,
//                     )),
//                 msaSizeBox(),
//                 AutoSizeText(
//                   translate("gantt_chart.dialysis_page.protein_intake"),
//                   minFontSize: 14,
//                   maxLines: 1,
//                 ),
//                 msaSizeBox(),
//                 Container(
//                     padding: const EdgeInsets.only(left: 10, top: 2),
//                     decoration: const ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                         color: Colors.grey,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     )),
//                     width: width,
//                     child: DropDownForm(
//                       onChanged: (String? v) {
//                         setState(() {
//                           protienGoalValue = v!;
//                         });
//                       },
//                       v: protienGoal,
//                     )),
//                 msaSizeBox(),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Step(
//         isActive: (_index >= 2) ? true : false,
//         title: haveNutritionValue
//             ? DisplayResultStep(
//                 type: "nutrition_parameter_baseline",
//                 width: width,
//                 albumin: albuminResult,
//                 prealbumin: prealbuminResult,
//               )
//             : AutoSizeText(
//                 translate("gantt_chart.dialysis_page.title_3"),
//                 minFontSize: 16,
//                 maxLines: 1,
//               ),
//         content: Form(
//           key: _fkDp3,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AutoSizeText(
//                   translate("gantt_chart.dialysis_page.serum_albumin"),
//                   minFontSize: 14,
//                   maxLines: 1,
//                 ),
//                 MsaFormField(
//                   controller: albuminController,
//                   controllerFocus: albuminFocus,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(numberRegExp)
//                   ],
//                   hint: translate("gantt_chart.fill_info"),
//                   onChanged: (v) {
//                     setState(() {
//                       albuminValue = albuminController.text;
//                     });
//                   },
//                   validator: (String? v) {
//                     if (v == null || v.isEmpty) {
//                       return 'Cannot empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 AutoSizeText(
//                   translate("gantt_chart.dialysis_page.serum_prealbumin"),
//                   minFontSize: 14,
//                   maxLines: 1,
//                 ),
//                 MsaFormField(
//                   controller: prealbuminController,
//                   controllerFocus: prealbuminFocus,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(numberRegExp)
//                   ],
//                   hint: translate("gantt_chart.fill_info"),
//                   onChanged: (v) {
//                     setState(() {
//                       prealbuminValue = prealbuminController.text;
//                     });
//                   },
//                   validator: (String? v) {
//                     if (v == null || v.isEmpty) {
//                       return 'Cannot empty';
//                     }
//                     return null;
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Step(
//           isActive: (_index >= 3) ? true : false,
//           title: haveFollowUpValue
//               ? DisplayResultStep(
//                   type: "nutrition_parameter_follow_up",
//                   width: width,
//                   followUpBmi: followUpValue,
//                   diffBodyWeight: diffBodyWeightValue,
//                   diffAlbumin: diffAlbuminValue,
//                   diffPrealbumin: diffPrealbuminValue,
//                   intervention: interventionResult,
//                 )
//               : AutoSizeText(
//                   translate("gantt_chart.dialysis_page.title_4"),
//                   minFontSize: 16,
//                   maxLines: 1,
//                 ),
//           content: Form(
//             key: _fkDp4,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AutoSizeText(
//                     translate(
//                         "gantt_chart.dialysis_page.intervention_duration"),
//                     minFontSize: 14,
//                     maxLines: 1,
//                   ),
//                   MsaFormField(
//                     controller: interventionController,
//                     controllerFocus: interventionFocus,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(numberRegExp)
//                     ],
//                     hint: translate("gantt_chart.fill_info"),
//                     onChanged: (v) {
//                       setState(() {
//                         interventionValue = interventionController.text;
//                       });
//                     },
//                     validator: (String? v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Cannot empty';
//                       }
//                       return null;
//                     },
//                   ),
//                   AutoSizeText(
//                     translate("gantt_chart.dialysis_page.actual_weight"),
//                     minFontSize: 14,
//                     maxLines: 1,
//                   ),
//                   MsaFormField(
//                     controller: followUpActualController,
//                     controllerFocus: followUpActualFocus,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(numberRegExp)
//                     ],
//                     hint: translate("gantt_chart.fill_info"),
//                     onChanged: (v) {
//                       setState(() {
//                         followUpActualValue = followUpActualController.text;
//                       });
//                     },
//                     validator: (String? v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Cannot empty';
//                       }
//                       return null;
//                     },
//                   ),
//                   msaSizeBox(height: 20),
//                   Row(
//                     // Dashed line
//                     children: [
//                       for (int i = 0; i < width / 8.5; i++)
//                         Container(
//                           width: 5,
//                           height: 1,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: 1,
//                                 color: i % 2 == 0
//                                     ? const Color.fromRGBO(214, 211, 211, 1)
//                                     : Colors.transparent,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                   msaSizeBox(height: 10),
//                   AutoSizeText(
//                     translate("gantt_chart.dialysis_page.serum_albumin"),
//                     minFontSize: 14,
//                     maxLines: 1,
//                   ),
//                   MsaFormField(
//                     controller: albuminFollowUpController,
//                     controllerFocus: albuminFollowUpFocus,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(numberRegExp)
//                     ],
//                     hint: translate("gantt_chart.fill_info"),
//                     onChanged: (v) {
//                       setState(() {
//                         albuminFollowUpValue = albuminFollowUpController.text;
//                       });
//                     },
//                     validator: (String? v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Cannot empty';
//                       }
//                       return null;
//                     },
//                   ),
//                   AutoSizeText(
//                     translate("gantt_chart.dialysis_page.serum_prealbumin"),
//                     minFontSize: 14,
//                     maxLines: 1,
//                   ),
//                   MsaFormField(
//                     controller: prealbuminFollowUpController,
//                     controllerFocus: prealbuminFollowUpFocus,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(numberRegExp)
//                     ],
//                     hint: translate("gantt_chart.fill_info"),
//                     onChanged: (v) {
//                       setState(() {
//                         prealbuminFollowUpValue =
//                             prealbuminFollowUpController.text;
//                       });
//                     },
//                     validator: (String? v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Cannot empty';
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           )),
//       Step(
//         isActive: (_index >= 4) ? true : false,
//         title: Text(translate("gantt_chart.perio_page.summary")),
//         subtitle: Text(translate("gantt_chart.perio_page.check_result")),
//         content: msaSizeBox(),
//       )
//     ];

//     return Scaffold(
//       appBar: MsaAppBar(
//         haveTutor: true,
//         title: translate("gantt_chart.dialysis_page.dialysis_patient"),
//         maxLines: 2,
//         ctx: context,
//         onPressed: () => showDialog<String>(
//           context: context,
//           builder: (BuildContext context) => MsaHintAlert(
//             context: context,
//             ifPicture: false,
//             haveButton: true,
//             have2Button: true,
//             haveColorText: true,
//             haveQuestions: false,
//             title: translate("warning_page_start.warning"),
//             width: width,
//             height: height / 2,
//             onPressedYes: () {
//               Navigator.of(context)
//                 ..pop()
//                 ..pop();
//             },
//             onPressedNo: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         onPressedHint: () => showDialog<String>(
//           context: context,
//           builder: (BuildContext context) => MsaHintAlert(
//             context: context,
//             ifPicture: true,
//             haveButton: false,
//             haveColorText: false,
//             haveQuestions: false,
//             haveCloseButton: true,
//             title: 'User Manual',
//             subTextContent:
//                 "Description : Nutritional status screening page \n1. progress tube is a tube that indicates the status of the nutritional status screening.\n2. Calculate BMI, enter weight and height, then enter confirmation to calculate BMI.\n3. There are four screening topics, each with a yes and no answer.",
//             height: height / 2,
//             width: width,
//           ),
//         ),
//       ),
//       body: GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Stack(
//           children: <Widget>[
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/bg.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: CardContent(
//                 w: width - 40,
//                 h: height / 1.20,
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
//                   child: MsaStepper(
//                     context: context,
//                     currentStep: _index,
//                     onStepCancel: () {
//                       if (_index > 0) {
//                         setState(() {
//                           _index -= 1;
//                         });
//                       }

//                       if (_index == 0) {
//                         setState(() {
//                           haveBMIValue = false;
//                         });
//                       } else if (_index == 1) {
//                         setState(() {
//                           haveCase2Value = false;
//                         });
//                       } else if (_index == 2) {
//                         setState(() {
//                           haveNutritionValue = false;
//                         });
//                       } else if (_index == 3) {
//                         setState(() {
//                           haveFollowUpValue = false;
//                         });
//                       }
//                     },
//                     //*continue
//                     onStepContinue: () {
//                       if (_fkDp1.currentState!.validate() ||
//                           _fkDp2.currentState!.validate() ||
//                           _fkDp3.currentState!.validate() ||
//                           _fkDp4.currentState!.validate()) {
//                         if (_index <= getStep.length - 1) {
//                           // To next Step
//                           if (_index == 0) {
//                             setState(() {
//                               haveBMIValue = true;
//                               _fkDp1.currentState?.reset();
//                               _fkDp2.currentState?.reset();
//                               _fkDp3.currentState?.reset();
//                               _fkDp4.currentState?.reset();

//                               var wD = double.parse(wValue);
//                               var hD = double.parse(hValue);

//                               var egfrRaw = double.parse(egfrValue);
//                               egfrValue = formatter.format(egfrRaw);
//                               var bmi = calculateBMI(wD, hD);
//                               bmiValue = bmi.toStringAsFixed(2);
//                               resultBmi = getResult(bmi);
//                               ibw = calculateIBW(hD, sexValue);
//                               ibwValue = ibw.toStringAsFixed(2);

//                               _index += 1;
//                             });
//                           } else if (_index == 1) {
//                             setState(() {
//                               haveCase2Value = true;
//                               _fkDp1.currentState?.reset();
//                               _fkDp2.currentState?.reset();
//                               _fkDp3.currentState?.reset();
//                               _fkDp4.currentState?.reset();

//                               var edRaw = double.parse(edValue);
//                               var edReqRaw = double.parse(energyGoalValue);

//                               var pdRaw = double.parse(pdValue);
//                               var pdReqRaw = double.parse(protienGoalValue);

//                               var ed = calculateGanttChart("ed", edRaw, ibw);
//                               var edr = calculateGanttChart("ed", pdRaw, ibw);
//                               var pd = calculateGanttChart("pd", edReqRaw, ibw);
//                               var pdr =
//                                   calculateGanttChart("pd", pdReqRaw, ibw);

//                               edResult = formatter.format(ed);
//                               edReqResult = formatter.format(edr);
//                               pdResult = formatter.format(pd);
//                               pdReqResult = formatter.format(pdr);

//                               _index += 1;
//                             });
//                           } else if (_index == 2) {
//                             setState(() {
//                               haveNutritionValue = true;
//                               _fkDp1.currentState?.reset();
//                               _fkDp2.currentState?.reset();
//                               _fkDp3.currentState?.reset();
//                               _fkDp4.currentState?.reset();

//                               var albuminRaw = double.parse(albuminValue);
//                               var prealbuminRaw = double.parse(prealbuminValue);
//                               albuminResult = formatter.format(albuminRaw);
//                               prealbuminResult =
//                                   formatter.format(prealbuminRaw);

//                               _index += 1;
//                             });
//                           } else if (_index == 3) {
//                             setState(() {
//                               _fkDp1.currentState?.reset();
//                               _fkDp2.currentState?.reset();
//                               _fkDp3.currentState?.reset();
//                               _fkDp4.currentState?.reset();

//                               var wD = double.parse(wValue);
//                               var hD = double.parse(hValue);

//                               var albuminBaseline = double.parse(albuminValue);
//                               var albuminFollowUp =
//                                   double.parse(albuminFollowUpValue);

//                               var prealbuminBaseline =
//                                   double.parse(prealbuminValue);
//                               var prealbuminFollowUp =
//                                   double.parse(prealbuminFollowUpValue);
//                               var followUpRaw =
//                                   double.parse(followUpActualValue);
//                               var interventionRaw =
//                                   double.parse(interventionValue);

//                               var fuawValue = calculateGanttChart(
//                                   "fu-bmi", followUpRaw, hD);
//                               var diffBwValue = calculateGanttChart(
//                                   "diff-bw", followUpRaw, wD);
//                               var diffAlValue = calculateGanttChart(
//                                   "diff-al", albuminBaseline, albuminFollowUp);
//                               var diffPalValue = calculateGanttChart("diff-pal",
//                                   prealbuminBaseline, prealbuminFollowUp);

//                               followUpValue = formatter.format(fuawValue);
//                               diffBodyWeightValue =
//                                   formatter.format(diffBwValue);
//                               diffAlbuminValue = formatter.format(diffAlValue);
//                               diffPrealbuminValue =
//                                   formatter.format(diffPalValue);
//                               interventionResult =
//                                   formatter.format(interventionRaw);

//                               haveFollowUpValue = true;

//                               _index += 1;
//                             });
//                           } else {
//                             Navigator.of(context).pushAndRemoveUntil(
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomeScreen()),
//                                 (Route<dynamic> route) => false);
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) =>
//                             //         GanttChartDialysisTodoScreen(
//                             //       buildContext: context,
//                             //     ),
//                             //   ),
//                             // );
//                           }
//                         }
//                       }
//                     },
//                     //*on tab
//                     onStepTapped: (int index) => null,
//                     steps: getStep,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
