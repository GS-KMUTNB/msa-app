import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

import 'screens/screens.dart';

const appName = "MSA";

void main() {
  runApp(const MsaApp());
}

class MsaApp extends StatelessWidget {
  const MsaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: msaData(),
      home: HomeScreen(
        buildContext: context,
      ),
    );
  }
}
