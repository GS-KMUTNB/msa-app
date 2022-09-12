final numberRegExp = RegExp(r'[0-9]{1,2}[.,]\d{1,2}');

extension ExtString on String {
  bool get isValidNumber {
    return numberRegExp.hasMatch(this);
  }

  bool get isNotNull {
    // ignore: unnecessary_null_comparison
    return this != null;
  }
}
