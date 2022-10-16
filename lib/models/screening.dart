class Screening {
  final String date;
  final String weight;
  final String height;
  final String bmi;
  final List<String>? formData;

  const Screening(
    this.date,
    this.weight,
    this.height,
    this.bmi,
    this.formData,
  );
}

class NutritionalForm {
  final String question;
  final String answer;
  final String index;

  const NutritionalForm(
    this.question,
    this.answer,
    this.index,
  );
}
