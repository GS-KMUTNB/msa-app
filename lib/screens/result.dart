// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/shared.dart';
// import '../theme/theme.dart';

class ResultScreen extends StatelessWidget {
  final List<String> data;

  const ResultScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // print("=======================");

    // print(data);

    var now = DateFormat('dd-MM-yyyy').format(DateTime.now());

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
                    Text("Date : $now"),
                    const Text("Weight"),
                    const Text("Height"),
                    const Text("BMI"),
                    const Text("data"),
                    const Text("data"),
                    const Text("data"),
                    const Text("data"),
                    const Text("data"),
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
