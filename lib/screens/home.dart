import 'package:flutter/material.dart';
import 'package:msa_app/shared/appbar.dart';
import 'package:msa_app/shared/scaffold.dart';
import 'package:msa_app/theme/theme.dart';

import '../shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        ctx: context,
        title: "Menu",
        isLanguageScreen: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
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
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/logo-transparent.png"),
                  ),
                ),
              ),
              Text(
                "Select Language",
                style: head1NoWeight,
              ),
              msaSizeBox(height: 10),
              Center(
                child: CardLanguageScreen(
                  w: _width - 100,
                  h: _height / 2.2,
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
