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

class HtmlPerioForm {
  final String energyGoal;
  final String protienGoal;
  final String energyRequirement;
  final String protienRequirement;
  final String actualOral;
  final String actualOralPercent;

  HtmlPerioForm(
    this.energyGoal,
    this.protienGoal,
    this.energyRequirement,
    this.protienRequirement,
    this.actualOral,
    this.actualOralPercent,
  );
}
