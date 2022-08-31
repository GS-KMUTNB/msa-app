import 'package:flutter/material.dart';

class MsaAppBar extends AppBar {
  MsaAppBar({
    Key? key,
    String title = "",
  }) : super(
          key: key,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(title),
        );
}
