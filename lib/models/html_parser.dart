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

class HtmlResultPerioCalculateForm {
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

  HtmlResultPerioCalculateForm({
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

class HtmlResultDialysisCalculateForm {
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
  final String egfr;
  final String ckdStage;
  final String renalReplacement;
  final String energyIntake;
  final String protienIntake;
  final String energyDiaryIntake;
  final String protienDiaryIntake;
  final String albuminBaseline;
  final String preAlbuminBaseline;
  final String albuminFollowUp;
  final String preAlbuminFollowUp;
  final String intervention;
  final String followUpActualWeight;
  final String followUpBMI;
  final String diffBodyWeight;
  final String diffAlbumin;
  final String diffPreAlbumin;

  HtmlResultDialysisCalculateForm({
    required this.energyGoal,
    required this.protienGoal,
    required this.energyRequirement,
    required this.protienRequirement,
    required this.sex,
    required this.date,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.ibw,
    required this.egfr,
    required this.ckdStage,
    required this.renalReplacement,
    required this.energyIntake,
    required this.protienIntake,
    required this.energyDiaryIntake,
    required this.protienDiaryIntake,
    required this.albuminBaseline,
    required this.preAlbuminBaseline,
    required this.albuminFollowUp,
    required this.preAlbuminFollowUp,
    required this.intervention,
    required this.followUpActualWeight,
    required this.followUpBMI,
    required this.diffBodyWeight,
    required this.diffAlbumin,
    required this.diffPreAlbumin,
  });
}
