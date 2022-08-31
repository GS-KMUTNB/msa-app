import 'package:flutter/material.dart';

class MsaScaffold extends Scaffold {
  MsaScaffold({
    Key? key,
    required String bgImage, // only name of image
    required PreferredSizeWidget appbar,
    required List<Widget> body,
  }) : super(
          key: key,
          appBar: appbar,
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/$bgImage"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: body,
              ),
            ],
          ),
        );
}
