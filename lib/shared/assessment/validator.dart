final numberRegExp = RegExp(r'(^\d*\.?\d*)');

extension ExtString on String {
  bool get isValidNumber {
    return numberRegExp.hasMatch(this);
  }

  bool get isNotNull {
    // ignore: unnecessary_null_comparison
    return this != null;
  }
}
