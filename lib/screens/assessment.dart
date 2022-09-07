import 'package:flutter/material.dart';
import 'package:msa_app/shared/shared.dart';

import '../../theme/theme.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final TextEditingController weightController = TextEditingController();
  final FocusNode weightFocus = FocusNode();

  final TextEditingController heightController = TextEditingController();
  final FocusNode hightFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // int validatePassword(String pswd) {
  //   if (pswd.isEmpty || pswd.length == 0) {
  //     return 1;
  //   } else if (pswd != null && pswd.isNotEmpty && pswd.length <= 8) {
  //     return 2;
  //   } else {
  //     return 0;
  //   }
  // }

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        ctx: context,
        title: "Assessment",
        onPressed: () {
          Navigator.pop(context);
        },
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
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView(
                    controller: _controller,
                    children: [
                      // ignore: fixme
                      MsaProgressBar(), //FIXME add logic for progressbar
                      msaSizeBox(height: 10),
                      BmiForm(
                        heightController: heightController,
                        hightFocus: hightFocus,
                        weightController: weightController,
                        weightFocus: weightFocus,
                      ),
                      msaSizeBox(height: 250),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // MsaScaffold(
    // appbar: MsaAppBar(
    //   ctx: context,
    //   title: "Assessment",
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // ),
    //   bgImage: "bg.png",
    //   body: [
    //     GestureDetector(
    // behavior: HitTestBehavior.opaque,
    // onTap: () {
    //   FocusScope.of(context).requestFocus(FocusNode());
    // },
    //       child: Container(
    //         padding: EdgeInsets.all(15.0),
    // child: ListView(
    //   controller: _controller,
    //   children: [
    // BmiForm(
    //   heightController: heightController,
    //   hightFocus: hightFocus,
    //   weightController: weightController,
    //   weightFocus: weightFocus,
    // ),
    // SizedBox(
    //   height: 250.0,
    // ),
    //     CardContent(
    //       w: width - 40,
    //       h: height / 1.20,
    //       color: Colors.white,
    //       child: Padding(
    //         padding: const EdgeInsets.all(30),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // Progress Bar
    //             // ignore: fixme
    // MsaProgressBar(), //FIXME add logic for progressbar
    // msaSizeBox(height: 10),
    //             // BMI form
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 250.0,
    //     ),
    //           ],
    //           // children: [
    //           // CardContent(
    //           //   w: width - 40,
    //           //   h: height / 1.20,
    //           //   color: Colors.white,
    //           //   child: SingleChildScrollView(
    //           //     physics: const BouncingScrollPhysics(),
    //           //     child: Padding(
    //           //       padding: const EdgeInsets.all(30),
    //           //       child: Column(
    //           //         crossAxisAlignment: CrossAxisAlignment.start,
    //           //         children: [
    //           //           // Progress Bar
    //           //           // ignore: fixme
    //           //           MsaProgressBar(), //FIXME add logic for progressbar
    //           //           msaSizeBox(height: 10),
    //           //           // BMI form
    //           //           BmiForm(),
    //           //         ],
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //           // ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
