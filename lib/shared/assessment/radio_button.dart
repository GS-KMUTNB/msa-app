import 'package:flutter/material.dart';

typedef StepperRadioCallBack = void Function(Object?)?;

class StepperRadioButton extends Container {
  StepperRadioButton({
    Key? key,
    required double width,
    required Function(Object?)? onChangedYes,
    required Function(Object?)? onChangedNo,
    required Object? groupValueYes,
    required Object? groupValueNo,
  }) : super(
          key: key,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
                child: ListTile(
                  dense: true,
                  title: const Text("Yes"),
                  leading: Radio(
                    value: 0,
                    groupValue: groupValueYes,
                    onChanged: onChangedYes,
                    activeColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 30,
                child: ListTile(
                  dense: true,
                  title: const Text("No"),
                  leading: Radio(
                    value: 1,
                    groupValue: groupValueNo,
                    onChanged: onChangedNo,
                    activeColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
}
