import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/screens/screens.dart';
import 'package:msa_app/theme/theme.dart';

import '../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return MsaScaffold(
      appbar: MsaAppBar(
        ctx: context,
        title: "Menu",
        isLanguageScreen: true,
      ),
      bgImage: "language-screen.png",
      body: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                msaSizeBox(height: 120),
                const AutoSizeText(
                  "Nutrition Screening Tool",
                  style: head1,
                  maxLines: 1,
                  minFontSize: 1,
                  textAlign: TextAlign.center,
                ),
                msaSizeBox(height: 10),
                const AutoSizeText(
                  "Select Language",
                  style: TextStyle(fontSize: 22),
                  maxLines: 1,
                ),
                msaSizeBox(height: 30),
                CardLanguageScreen(
                  w: width - 100,
                  h: height / 3.2,
                  color: primaryColor1,
                  engButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DescriptionScreen(),
                      ),
                    );
                  },
                  thaiButton: () {},
                ),
                Container(
                  width: 150.0,
                  height: 120.0,
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
