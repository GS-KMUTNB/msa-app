import 'package:flutter/material.dart';
import 'package:thaiosk/shared/shared.dart';

class MSAScaffold extends Scaffold {
  MSAScaffold({
    Key? key,
    String appbarTitle = "",
    required Widget body,
  }) : super(
          key: key,
          appBar: MSAAppBar(
            title: appbarTitle,
          ),
          body: body,
        );
}
