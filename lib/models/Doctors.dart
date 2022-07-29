class Doctor {
  late String name;
  late int yearsOfExp;
  late String specialisation;
  late String profileUrl;

  Doctor(this.name, this.yearsOfExp, this.specialisation);
}

List doctors = [
  Doctor("Lal Bihari", 100, "Brain"),
  Doctor("Harsh", -2, "Knee"),
  Doctor("Mukesh", 200, "Ear")
];