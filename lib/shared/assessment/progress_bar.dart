import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class MsaProgressBar extends SizedBox {
  MsaProgressBar({
    Key? key,
  }) : super(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Progress",
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
