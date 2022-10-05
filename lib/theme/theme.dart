import 'package:flutter/material.dart';

const prompt = "Prompt";

const whiteColor = Colors.white;
const blackColor = Colors.black;

const bgColor = Color(0xFFDDDDDD);
const subBgColor = Color(0xFFEBEBEB);
const warningColor = Color(0xFFFF0000);

const primaryColor = Color(0xFF2A3158);
const primaryColor1 = Color(0xFF757090);
const primaryColor2 = Color(0xFFB195A5);
const primaryColor3 = Color(0xFFD8B3A5);
const primaryColor4 = Color(0xFFFFDD91);

const double fontSizeH1 = 35.00;
const double fontSizeH2 = 30.00;
const double fontSizeH3 = 25.00;
const double fontSizeH4 = 20.00;
const double fontSizeH5 = 18.00;
const double fontSizeH6 = 15.00;

/// msaSizeBox for default sized box return = 5
SizedBox msaSizeBox({
  double height = 5,
  double width = 5,
}) =>
    SizedBox(
      height: height,
      width: width,
    );

/// textTheme all custom list of texttheme
const TextTheme textTheme = TextTheme(
  headline1: head1,
  headline2: head2,
  headline3: head3,
  headline4: head4,
  headline5: head5,
  headline6: head6,
  subtitle1: subtitle1,
  subtitle2: subtitle2,
  bodyText1: bodyText1,
  bodyText2: bodyText2,
  caption: caption,
);

const head1 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w700,
  fontSize: fontSizeH1,
  fontStyle: FontStyle.normal,
  color: primaryColor,
);

const head1Gant = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w700,
  fontSize: fontSizeH5,
  fontStyle: FontStyle.normal,
  color: primaryColor,
);

const head1NoWeight = TextStyle(
  fontFamily: prompt,
  fontSize: fontSizeH1,
  fontStyle: FontStyle.normal,
  color: primaryColor,
);

const head2 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w600,
  fontSize: fontSizeH2,
  letterSpacing: 0.4,
  height: 1.0,
  color: blackColor,
);

const head3 = TextStyle(
  fontFamily: prompt,
  fontSize: fontSizeH3,
  letterSpacing: 0.2,
  color: primaryColor4,
);

const head4 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w500,
  fontSize: fontSizeH4,
  letterSpacing: 0.1,
  color: blackColor,
);

const head5 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w500,
  fontSize: fontSizeH5,
  letterSpacing: 0.1,
  color: blackColor,
);

const head6 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w100,
  fontSize: fontSizeH6,
  letterSpacing: 0.2,
  color: blackColor,
);

const subtitle1 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w100,
  fontSize: fontSizeH6,
  letterSpacing: 0.2,
  color: blackColor,
);

const subtitle2 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w100,
  fontSize: fontSizeH6,
  letterSpacing: 0.2,
  color: blackColor,
);

const bodyText1 = TextStyle(
  fontFamily: prompt,
  fontSize: fontSizeH4,
  letterSpacing: 0.2,
  color: primaryColor,
);

const bodyText2 = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w100,
  fontSize: fontSizeH6,
  letterSpacing: 0.2,
  color: blackColor,
);

const whiteText = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w100,
  fontSize: fontSizeH6,
  letterSpacing: 0.2,
  color: whiteColor,
);

const caption = TextStyle(
  fontFamily: prompt,
  fontWeight: FontWeight.w100,
  fontSize: fontSizeH6,
  letterSpacing: 0.2,
  color: blackColor,
);

ThemeData msaData() => ThemeData(
      textTheme: textTheme,
      primaryColor: primaryColor,
    );
