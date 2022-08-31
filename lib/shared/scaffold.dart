import 'package:flutter/material.dart';
// import 'package:msa_app/shared/shared.dart';

class MsaScaffold extends Scaffold {
  const MsaScaffold({
    Key? key,
    String appbarTitle = "",
    bool isHomeScreen = true,
    required Widget body,
  }) : super(
          key: key,
          // appBar: MsaAppBar(
          //   title: appbarTitle,
          // ),
          body: body,
        );
}
