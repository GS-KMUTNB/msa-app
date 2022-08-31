import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../shared/shared.dart';
import '../theme/theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return MsaScaffold(
      appbar: MsaAppBar(
        ctx: context,
        title: "Menu",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bgImage: "bg.png",
      body: [
        Center(
          child: CardContent(
            w: width - 40,
            h: height / 1.20,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    msaSizeBox(height: 30),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      padding: const EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage("assets/images/logo-transparent.png"),
                        ),
                      ),
                    ),
                    const AutoSizeText(
                      "Welcome To MSA Application",
                      style: bodyText1,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: const Divider(
                              color: primaryColor4,
                              height: 36,
                              thickness: 3,
                            )),
                      ),
                      const Text("Select Menu"),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: const Divider(
                              color: primaryColor4,
                              height: 36,
                              thickness: 3,
                            )),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: MsaButton(
                        color: primaryColor4,
                        onPressed: () {},
                        text: 'Nutritional\nscreening form',
                        textStyle: bodyText1,
                        h: 120,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
