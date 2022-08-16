class Doctor {
  late String name;
  late int yearsOfExp;
  late String specialisation;
  late String education;

  Doctor(this.name, this.yearsOfExp, this.specialisation, this.education);
}

List doctors = [
  Doctor("Lal Bihari", 100, "Brain", "Some edu 1"),
  Doctor("Harsh", -2, "Knee", "Some edu 2"),
  Doctor("Mukesh", 200, "Ear", "Some edu 1")
];