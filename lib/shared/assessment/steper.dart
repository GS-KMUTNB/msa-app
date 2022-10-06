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
    // ignore: fixme
    // bool lastStep = false, FIXME
  }) : super(
          key: key,
          child: Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primaryColor,
                  ),
              fontFamily: prompt,
            ),
            child: Stepper(
              physics: const BouncingScrollPhysics(),
              steps: steps,
              currentStep: currentStep,
              onStepCancel: onStepCancel,
              onStepContinue: onStepContinue,
              onStepTapped: onStepTapped,
              // controlsBuilder: (BuildContext context, ControlsDetails details) {
              //   return Row(
              //     children: <Widget>[
              //       TextButton(
              //         onPressed: details.onStepContinue,
              //         child: const Text('NEXT'),
              //       ),
              //       TextButton(
              //         onPressed: details.onStepCancel,
              //         child: const Text('CANCEL'),
              //       ),
              //     ],
              //   );
              // },
            ),
          ),
        );
}
