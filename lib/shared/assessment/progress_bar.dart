import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class MsaProgressBar extends SizedBox {
  MsaProgressBar({
    Key? key,
    String bmi = "",
    bool haveBMI = false,
  }) : super(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Progress",
                    style: bodyText1,
                  ),
                  haveBMI
                      ? Text(
                          "Your BMI: $bmi",
                          style: bodyText1,
                        )
                      : const SizedBox(),
                ],
              ),
              msaSizeBox(),
              const LinearProgressIndicator(
                value: 100,
              ),
            ],
          ),
        );
}
