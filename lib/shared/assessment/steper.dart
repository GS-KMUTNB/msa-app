// import 'package:flutter/material.dart';

// import '../shared.dart';
// import '../../theme/theme.dart';

// class AssessmentStepperScreen extends StatelessWidget {
//   const AssessmentStepperScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     return MsaScaffold(
//       appbar: MsaAppBar(
//         ctx: context,
//         title: "Assessment",
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       bgImage: "bg.png",
//       body: [
//         Center(
//           child: CardContent(
//             w: width - 40,
//             h: height / 1.20,
//             color: Colors.white,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Progress Bar
//                     const MsaProgressBar(),
//                     msaSizeBox(height: 20),
//                     // BMI form
//                     SizedBox(
//                       width: 60,
//                       child: MaterialButton(
//                         onPressed: () {},
//                         color: primaryColor,
//                         textColor: Colors.white,
//                         padding: const EdgeInsets.all(16),
//                         shape: const CircleBorder(),
//                         child: const Text("BMI"),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
