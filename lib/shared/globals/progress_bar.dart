import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class MsaProgressBar extends StatefulWidget {
  const MsaProgressBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MsaProgressBarState();
  }
}

class MsaProgressBarState extends State<MsaProgressBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Progress",
          style: bodyText1,
        ),
        msaSizeBox(),
        const LinearProgressIndicator(
          value: 50,
        ),
      ],
    );
  }
}
