import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:msa_app/theme/theme.dart';

import 'screens/screens.dart';

const appName = "MSA";

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'th', supportedLocales: ['th', 'en']);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(LocalizedApp(delegate, const MsaApp()));
}

class MsaApp extends StatelessWidget {
  const MsaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: appName,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        debugShowCheckedModeBanner: false,
        theme: msaData(),
        home: const SplashScreen(),
        // home: DialysisPatientScreen(
        //   buildContext: context,
        // ),
      ),
    );
  }
}
