import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class MsaStepper extends Container {
  MsaStepper({
    Key? key,
    required BuildContext context,
    required int currentStep,
    required Function() onStepCancel,
    required Function() onStepContinue,
    required Function(int) onStepTapped,
    required List<Step> steps,
  }) : super(
          key: key,
          child: Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primaryColor,
                  ),
            ),
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepCancel: onStepCancel,
              onStepContinue: onStepContinue,
              onStepTapped: onStepTapped,
            ),
          ),
        );
}
