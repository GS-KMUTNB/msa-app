// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

import '../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required BuildContext buildContext,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        ctx: context,
        title: "Menu",
        isLanguageScreen: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/language-screen.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            children: [
              msaSizeBox(height: 10),
              Container(
                width: 150.0,
                height: 150.0,
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/logo-transparent.png"),
                  ),
                ),
              ),
              const Text(
                "Select Language",
                style: head1NoWeight,
              ),
              msaSizeBox(height: 10),
              Center(
                child: CardLanguageScreen(
                  w: width - 100,
                  h: height / 2.2,
                  color: primaryColor1,
                  engButton: () {},
                  thaiButton: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
