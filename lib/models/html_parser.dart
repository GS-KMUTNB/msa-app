class HtmlSNSForm {
  final String date;
  final String weight;
  final String height;
  final String bmi;
  final List<String> answer;
  final String result_1;
  final String result_2;

  const HtmlSNSForm(
    this.date,
    this.weight,
    this.height,
    this.bmi,
    this.answer,
    this.result_1,
    this.result_2,
  );
}

class HtmlResultCalculateForm {
  final String sex;
  final String date;
  final String weight;
  final String height;
  final String bmi;
  final String ibw;
  final String energyGoal;
  final String protienGoal;
  final String energyRequirement;
  final String protienRequirement;
  final String actualOral;
  final String actualOralPercent;

  HtmlResultCalculateForm({
    required this.energyGoal,
    required this.protienGoal,
    required this.energyRequirement,
    required this.protienRequirement,
    required this.actualOral,
    required this.actualOralPercent,
    required this.sex,
    required this.date,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.ibw,
  });
}
