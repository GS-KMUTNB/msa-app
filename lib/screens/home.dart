import 'package:flutter/material.dart';
import 'package:msa_app/shared/scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MsaScaffold(
      appbarTitle: "",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'MSA',
            ),
            Text(
              'counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
