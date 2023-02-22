class MainDataModal{
  MainDataModal({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.dob,
    this.maritalStatus,
    this.occupation,
    this.tradingXp,
    this.gir,
    this.address,
    this.profilePic,
    this.aadharOne,
    this.aadharTwo,
    this.panPic,
    this.password
  });
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? dob;
  String? maritalStatus;
  String? occupation;
  String? tradingXp;
  String? gir;
  String? address;
  String? profilePic;
  String? aadharOne;
  String? aadharTwo;
  String? panPic;
  String? password;

  factory MainDataModal.fromJson(Map<String, dynamic> json) {
    return MainDataModal(
      id: json["id"],
      name: json["name"]??"Name",
      email: json["email"],
      phone: json["phone"]??"01234567890",
      gender: json["gender"]??"Select Gender",
      dob: json["dob"]??"Select DOB",
      maritalStatus: json["maritalStatus"]??"Select Marital Status",
      occupation: json["occupation"]??" ",
      tradingXp: json["tradingXp"]??"Select a Range",
      gir: json["gir"]??"Select a Range",
      address: json["address"]??" ",
      profilePic: json["profilePic"]??" ",
      aadharOne: json["aadharOne"]??" ",
      aadharTwo: json["aadharTwo"]??" ",
      panPic: json["panPic"]??" ",
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "phone": this.phone,
      "gender": this.gender,
      "dob": this.dob,
      "maritalStatus": this.maritalStatus,
      "occupation": this.occupation,
      "tradingXp": this.tradingXp,
      "gir": this.gir,
      "address": this.address,
      "profilePic": this.profilePic,
      "aadharOne": this.aadharOne,
      "aadharTwo": this.aadharTwo,
      "panPic": this.panPic,
      "password": this.password,
    };
  }

//

}