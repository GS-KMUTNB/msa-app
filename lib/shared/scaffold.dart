import 'package:flutter/material.dart';
import 'package:msa_app/shared/shared.dart';

class MsaScaffold extends Scaffold {
  MsaScaffold({
    Key? key,
    String appbarTitle = "",
    required Widget body,
  }) : super(
          key: key,
          appBar: MsaAppBar(
            title: appbarTitle,
          ),
          body: body,
        );
}
