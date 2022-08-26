import 'package:flutter/material.dart';

class MSAAppBar extends AppBar {
  MSAAppBar({
    Key? key,
    String title = "",
  }) : super(
          key: key,
          title: Text(title),
        );
}
