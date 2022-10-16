import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/models/models.dart';
import 'package:msa_app/screens/screens.dart';

import '../shared/shared.dart';
import '../theme/theme.dart';

class GanttChartAddScreen extends StatefulWidget {
  final List<ExpenseData> data;

  const GanttChartAddScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<GanttChartAddScreen> createState() => _GanttChartAddState();
}

class _GanttChartAddState extends State<GanttChartAddScreen> {
  late List<ExpenseData> dataList;

  List<String> parenteral1 = <String>[
    'Item',
    'Amiparen',
    'Amiparen+GE-2',
    'BFLUID Inj',
    "D-10-N/2",
    "D-10-S",
    "D-10-W",
    "D-5-N/2",
    "D-5-S",
    "D-5-W",
    "GE-2",
    "Glucolyte-2",
    "Kabiven 1026 ml",
    "Kabiven 2053 ml",
    "Kabiven PI 1440 ml",
    "Kabiven PI 1920 ml",
    "LRS/ARS",
    "NSS",
    "Nutriflex Peri",
    "Oliclinomel-N4 1500 ml",
    "Oliclinomel-N4 2000 ml ",
    "Oliclinomel-N7 1000 ml ",
    "Oliclinomel-N7 2000 ml",
    "SMOFKabiven 1477 ml",
    "SMOFKabiven 986 ml",
    "SMOFKabiven PI 1448 ml",
    "SMOFKabiven PI 1904 ml",
  ];
  List<String> bag1 = <String>['#Bag', '1 Set', '2 Set', '3 Set'];

  List<String> parenteral2 = <String>[
    'Item',
    'Amiparen',
    'Amiparen+GE-2',
    'BFLUID Inj',
    "D-10-N/2",
    "D-10-S",
    "D-10-W",
    "D-5-N/2",
    "D-5-S",
    "D-5-W",
    "GE-2",
    "Glucolyte-2",
    "Kabiven 1026 ml",
    "Kabiven 2053 ml",
    "Kabiven PI 1440 ml",
    "Kabiven PI 1920 ml",
    "LRS/ARS",
    "NSS",
    "Nutriflex Peri",
    "Oliclinomel-N4 1500 ml",
    "Oliclinomel-N4 2000 ml ",
    "Oliclinomel-N7 1000 ml ",
    "Oliclinomel-N7 2000 ml",
    "SMOFKabiven 1477 ml",
    "SMOFKabiven 986 ml",
    "SMOFKabiven PI 1448 ml",
    "SMOFKabiven PI 1904 ml",
  ];
  List<String> bag2 = <String>['#Bag', '1 Set', '2 Set', '3 Set'];

  List<String> oral1 = <String>[
    "Item",
    "N/A",
    "NPO",
    "Normal Diet",
    "AMINOLEBAN-ORAL",
    "BD",
    "BD-DM",
    "BLENDERA-MF",
    "Ensure",
    "GEN-DM",
    "Glucerna",
    "Glucose syrup",
    "Impact",
    "Isocal",
    "NEO-MUNE",
    "Nepro",
    "Nutren",
    "ONCE Complete",
    "ONCE Dialyze",
    "ONCE Renal",
    "ONCE PRO",
    "PanEnteral",
    "Peptamen",
    "Solf Diet",
  ];

  List<String> percentOfDaily = <String>[
    "Please select",
    "0%",
    "10%",
    "20%",
    "30%",
    "40%",
    "50%",
    "60%",
    "70%",
    "80%",
    "90%",
    "100%",
  ];

  var parenteral1Value = "";
  var bag1Value = "";
  var parenteral2Value = "";
  var bag2Value = "";
  var percentDailyValue = "";
  var oral1Value = "";
  final _fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        ctx: context,
        haveTutor: true,
        title: "GANTT CHART Energy & Protein Intake Calculator",
        maxLines: 2,
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            ifPicture: false,
            haveButton: true,
            have2Button: true,
            haveColorText: true,
            haveQuestions: false,
            title: "Warning !!!",
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
        child: Form(
          key: _fkey,
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
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoundTextField(
                            width: width / 1.6,
                          ),
                          msaSizeBox(height: 10),
                          ContainerDropdown(
                            width: width,
                            title1: "Parenteral 1",
                            title2: "Parenteral 2",
                            height: height / 4.3,
                            widthParenteral: width / 2,
                            widthSet: width / 4,
                            colorContainer: primaryColor1,
                            textColor: whiteColor,
                            list1: parenteral1,
                            isDropDown: true,
                            onChanged1: (String? v) {
                              setState(() {
                                parenteral1Value = v!;
                              });
                            },
                            list2: bag1,
                            onChanged2: (String? v) {
                              setState(() {
                                bag1Value = v!;
                              });
                            },
                            list3: parenteral2,
                            onChanged3: (String? v) {
                              setState(() {
                                parenteral2Value = v!;
                              });
                            },
                            list4: bag2,
                            onChanged4: (String? v) {
                              setState(() {
                                bag2Value = v!;
                              });
                            },
                          ),
                          msaSizeBox(height: 10),
                          ContainerDropdown(
                            width: width,
                            title1: "Oral/Enteral 1",
                            title2: "Oral/Enteral 1",
                            height: height / 4.3,
                            widthParenteral: width / 2,
                            widthSet: width / 4,
                            colorContainer: primaryColor5,
                            textColor: blackColor,
                            isDropDown: false,
                            list1: oral1,
                            onChanged1: (String? v) {
                              setState(() {
                                oral1Value = v!;
                              });
                            },
                            list3: oral1,
                            onChanged3: (String? v) {
                              setState(() {
                                oral1Value = v!;
                              });
                            },
                          ),
                          msaSizeBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: width / 1.8,
                            // height: height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bgGreyColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AutoSizeText(
                                  "% of daily requirement",
                                  minFontSize: 15,
                                ),
                                Container(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 2),
                                    decoration: const ShapeDecoration(
                                        color: whiteColor,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                        )),
                                    width: width / 2,
                                    child: DropDownForm(
                                      v: percentOfDaily,
                                      onChanged: (String? v) {
                                        setState(() {
                                          percentDailyValue = v!;
                                        });
                                      },
                                    ))
                              ],
                            ),
                          ),
                          msaSizeBox(height: 30),
                          ContainerOfButton(
                            isAdd: true,
                            width: width,
                            widthButton: width,
                            onPressedCancel: () {
                              Navigator.pop(context);
                            },
                            onPressedContinue: () {
                              setState(() {
                                dataList.add(ExpenseData(
                                  id: 1,
                                  expenseCategory: 'test naja',
                                  pod1: 100,
                                  pod2: 100,
                                ));
                              });

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GanttChartTodoScreen(
                                    dataList: dataList,
                                    context: context,
                                  ),
                                ),
                              );
                            },
                            onPressedDelete: () {
                              // dataList.removeWhere((item) => item.id == '001');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// //FIXME WIP
// class GanttChartUpdateScreen extends StatefulWidget {
//   final List<ExpenseData> data;

//   const GanttChartUpdateScreen({
//     Key? key,
//     required this.data,
//   }) : super(key: key);

//   @override
//   State<GanttChartUpdateScreen> createState() => _GanttChartUpdateScreenState();
// }

// class _GanttChartUpdateScreenState extends State<GanttChartUpdateScreen> {
//   List<String> parenteral1 = <String>[
//     'Item',
//     'Amiparen',
//     'Amiparen+GE-2',
//     'BFLUID Inj',
//     "D-10-N/2",
//     "D-10-S",
//     "D-10-W",
//     "D-5-N/2",
//     "D-5-S",
//     "D-5-W",
//     "GE-2",
//     "Glucolyte-2",
//     "Kabiven 1026 ml",
//     "Kabiven 2053 ml",
//     "Kabiven PI 1440 ml",
//     "Kabiven PI 1920 ml",
//     "LRS/ARS",
//     "NSS",
//     "Nutriflex Peri",
//     "Oliclinomel-N4 1500 ml",
//     "Oliclinomel-N4 2000 ml ",
//     "Oliclinomel-N7 1000 ml ",
//     "Oliclinomel-N7 2000 ml",
//     "SMOFKabiven 1477 ml",
//     "SMOFKabiven 986 ml",
//     "SMOFKabiven PI 1448 ml",
//     "SMOFKabiven PI 1904 ml",
//   ];
//   List<String> bag1 = <String>['#Bag', '1 Set', '2 Set', '3 Set'];

//   List<String> parenteral2 = <String>[
//     'Item',
//     'Amiparen',
//     'Amiparen+GE-2',
//     'BFLUID Inj',
//     "D-10-N/2",
//     "D-10-S",
//     "D-10-W",
//     "D-5-N/2",
//     "D-5-S",
//     "D-5-W",
//     "GE-2",
//     "Glucolyte-2",
//     "Kabiven 1026 ml",
//     "Kabiven 2053 ml",
//     "Kabiven PI 1440 ml",
//     "Kabiven PI 1920 ml",
//     "LRS/ARS",
//     "NSS",
//     "Nutriflex Peri",
//     "Oliclinomel-N4 1500 ml",
//     "Oliclinomel-N4 2000 ml ",
//     "Oliclinomel-N7 1000 ml ",
//     "Oliclinomel-N7 2000 ml",
//     "SMOFKabiven 1477 ml",
//     "SMOFKabiven 986 ml",
//     "SMOFKabiven PI 1448 ml",
//     "SMOFKabiven PI 1904 ml",
//   ];
//   List<String> bag2 = <String>['#Bag', '1 Set', '2 Set', '3 Set'];

//   List<String> oral1 = <String>[
//     "Item",
//     "N/A",
//     "NPO",
//     "Normal Diet",
//     "AMINOLEBAN-ORAL",
//     "BD",
//     "BD-DM",
//     "BLENDERA-MF",
//     "Ensure",
//     "GEN-DM",
//     "Glucerna",
//     "Glucose syrup",
//     "Impact",
//     "Isocal",
//     "NEO-MUNE",
//     "Nepro",
//     "Nutren",
//     "ONCE Complete",
//     "ONCE Dialyze",
//     "ONCE Renal",
//     "ONCE PRO",
//     "PanEnteral",
//     "Peptamen",
//     "Solf Diet",
//   ];

//   List<String> percentOfDaily = <String>[
//     "Please select",
//     "0%",
//     "10%",
//     "20%",
//     "30%",
//     "40%",
//     "50%",
//     "60%",
//     "70%",
//     "80%",
//     "90%",
//     "100%",
//   ];

//   var parenteral1Value = "";
//   var bag1Value = "";
//   var parenteral2Value = "";
//   var bag2Value = "";
//   var percentDailyValue = "";
//   var oral1Value = "";

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     List<ExpenseData> dataList = widget.data;

//     return Scaffold(
//       appBar: MsaAppBar(
//         ctx: context,
//         haveTutor: true,
//         title: "GANTT CHART Energy & Protein Intake Calculator",
//         maxLines: 2,
//         onPressed: () => showDialog<String>(
//           context: context,
//           builder: (BuildContext context) => MsaHintAlert(
//             context: context,
//             ifPicture: false,
//             haveButton: true,
//             have2Button: true,
//             haveColorText: true,
//             haveQuestions: false,
//             title: "Warning !!!",
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
//         child: Form(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/bg.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: CardContent(
//                   w: width - 40,
//                   h: height / 1.20,
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RoundTextField(
//                             width: width / 1.6,
//                           ),
//                           msaSizeBox(height: 10),
//                           ContainerDropdown(
//                             width: width,
//                             title1: "Parenteral 1",
//                             title2: "Parenteral 2",
//                             height: height / 4.3,
//                             widthParenteral: width / 2,
//                             widthSet: width / 4,
//                             colorContainer: primaryColor1,
//                             textColor: whiteColor,
//                             list1: parenteral1,
//                             isDropDown: true,
//                             onChanged1: (String? v) {
//                               setState(() {
//                                 parenteral1Value = v!;
//                               });
//                             },
//                             list2: bag1,
//                             onChanged2: (String? v) {
//                               setState(() {
//                                 bag1Value = v!;
//                               });
//                             },
//                             list3: parenteral2,
//                             onChanged3: (String? v) {
//                               setState(() {
//                                 parenteral2Value = v!;
//                               });
//                             },
//                             list4: bag2,
//                             onChanged4: (String? v) {
//                               setState(() {
//                                 bag2Value = v!;
//                               });
//                             },
//                           ),
//                           msaSizeBox(height: 10),
//                           ContainerDropdown(
//                             width: width,
//                             title1: "Oral/Enteral 1",
//                             title2: "Oral/Enteral 1",
//                             height: height / 4.3,
//                             widthParenteral: width / 2,
//                             widthSet: width / 4,
//                             colorContainer: primaryColor5,
//                             textColor: blackColor,
//                             isDropDown: false,
//                             list1: oral1,
//                             onChanged1: (String? v) {
//                               setState(() {
//                                 oral1Value = v!;
//                               });
//                             },
//                             list3: oral1,
//                             onChanged3: (String? v) {
//                               setState(() {
//                                 oral1Value = v!;
//                               });
//                             },
//                           ),
//                           msaSizeBox(height: 10),
//                           Container(
//                             padding: const EdgeInsets.all(10),
//                             width: width / 1.8,
//                             // height: height,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: bgGreyColor,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const AutoSizeText(
//                                   "% of daily requirement",
//                                   minFontSize: 15,
//                                 ),
//                                 Container(
//                                     padding:
//                                         const EdgeInsets.only(left: 10, top: 2),
//                                     decoration: const ShapeDecoration(
//                                         color: whiteColor,
//                                         shape: RoundedRectangleBorder(
//                                           side: BorderSide(
//                                             width: 1.0,
//                                             style: BorderStyle.solid,
//                                             color: Colors.grey,
//                                           ),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20.0)),
//                                         )),
//                                     width: width / 2,
//                                     child: DropDownForm(
//                                       v: percentOfDaily,
//                                       onChanged: (String? v) {
//                                         setState(() {
//                                           percentDailyValue = v!;
//                                         });
//                                       },
//                                     ))
//                               ],
//                             ),
//                           ),
//                           msaSizeBox(height: 30),
//                           ContainerOfButton(
//                             isAdd: false,
//                             width: width,
//                             widthButton: width,
//                             onPressedCancel: () {
//                               Navigator.pop(context);
//                             },
//                             onPressedContinue: () {
//                               setState(() {
//                                 dataList.add(ExpenseData(
//                                   id: 1,
//                                   expenseCategory: 'test naja',
//                                   pod1: 100,
//                                   pod2: 100,
//                                 ));
//                               });

//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => GanttChartTodoScreen(
//                                     dataList: dataList,
//                                     context: context,
//                                   ),
//                                 ),
//                               );
//                             },
//                             onPressedDelete: () {
//                               dataList.removeWhere((item) => item.id == '001');
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
