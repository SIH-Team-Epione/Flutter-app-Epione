class Doctor {
  late String imagePath;
  late String name;
  late String hospital;
  late int yearsOfExp;
  late String specialisation; // 404
  late String education;
  late String about;
  late String phone;
  late String email; // 404
  late String website;
  late double x_cor;
  late double y_cor;
  late String address;

  Doctor(this.imagePath, this.name, this.yearsOfExp, this.specialisation,
      this.education, this.about, this.phone, this.email, this.website, this.x_cor, this.y_cor, this.address);
}

List doctors = [
  //1
  Doctor("assets/images/doctors/doc1.png", "Ms. Shrishti Dhupar", 1, "Therapist", "MA - Clinical Psychology",
      "Mr Shrishti Dhupar A Mental Health Professional and has experience of working in varied clinical settings. She has equipped herself with the practical tools and techniques used in therapy. Shrishti has an immense passion in working with women facing emotional distress and abuse. Her expertise in Child and Human Development also qualifies her as a specialist among Teens and Young Adults.",
      "011 4116 8518",
      "xpandeyed@gmail.com",
      "https://www.practo.com/delhi/therapist/9811882090-psychologist?practice_id=1295235&specialization=Psychologist&referrer=doctor_listing&utm_source=google",
      28.566137, 77.273090, "Happitude Studio")
];
