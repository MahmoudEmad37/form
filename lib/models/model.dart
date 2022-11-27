class Model {
  String? fName=" ";
  String? sName=" ";
  String? tName=" ";
  String? phone=" ";
  String? email=" ";
  String? age=" ";
  String? school=" ";

  Model();

  // Model(this.fName, this.sName, this.tName, this.phone, this.email, this.age,
  //     this.school);

  Map<String, dynamic> toJson() {
    return {
      'fName': this.fName,
      'sName': this.sName,
      'tName': this.tName,
      'phone': this.phone,
      'email': this.email,
      'age': this.age,
      'school': this.school,
    };
  }

  Model.fromJson(Map<String, dynamic> json)
      : fName = json['fName'] as String,
        sName = json['sName'] as String,
        tName = json['tName'] as String,
        phone = json['phone'] as String,
        email = json['email'] as String,
        age = json['age'] as String,
        school = json['school'] as String;
}
