import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/theme/theme.dart';

class MsaProgressBar extends SizedBox {
  MsaProgressBar({
    Key? key,
  }) : super(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translate("assesment_page.progress"),
                style: bodyText1,
              ),
              const SizedBox(
                width: 20,
              ),
              msaSizeBox(),
              const LinearProgressIndicator(
                value: 100,
              ),
            ],
          ),
        );
}
