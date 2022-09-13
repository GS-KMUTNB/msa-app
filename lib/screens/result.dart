// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import '../shared/shared.dart';
// import '../theme/theme.dart';

class ResultScreen extends StatelessWidget {
  final Screening data;

  const ResultScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var now = DateFormat('dd-MM-yyyy').format(DateTime.now());

    print("===========================");

    print("data");
    print(data.date);
    print(data.bmi);
    print(data.weight);
    print(data.height);
    print(data.formData);

    print("===========================");

    return MsaScaffold(
      appbar: MsaAppBar(
        ctx: context,
        title: "Result screening nutritional status",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bgImage: "bg.png",
      body: [
        Center(
          child: CardContent(
            w: width - 40,
            h: height / 1.20,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRowResult(header: 'Date : ', data: data.date, unit: ""),
                    TextRowResult(
                        header: 'Weight : ', data: data.weight, unit: "kg"),
                    TextRowResult(
                        header: 'Height : ', data: data.height, unit: "cm"),
                    TextRowResult(
                        header: 'BMI : ', data: data.bmi, unit: "kg./m^2"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
