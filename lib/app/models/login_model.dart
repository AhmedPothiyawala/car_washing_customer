class LoginModel {
  bool? status;
  User? user;
  String? messageEn;
  String? messageDe;

  LoginModel({this.status, this.user, this.messageEn, this.messageDe});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? gender;
  String? email;
  String? address;
  String? number;
  String? dOB;
  String? city;
  String? zIP;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? registerType;
  String? profilePicture;
  var userGroups;
  String? deletedAt;

  User(
      {this.id,
      this.firstName,
      this.gender,
      this.email,
      this.address,
      this.number,
      this.dOB,
      this.city,
      this.zIP,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.registerType,
      this.profilePicture,
      this.userGroups,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    gender = json['gender'];
    email = json['email'];
    address = json['address'];
    number = json['number'];
    dOB = json['DOB'];
    city = json['city'];
    zIP = json['ZIP'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    registerType = json['register_type'];
    profilePicture = json['profile_picture'];
    userGroups = json['user_groups'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['gender'] = gender;
    data['email'] = email;
    data['address'] = address;
    data['number'] = number;
    data['DOB'] = dOB;
    data['city'] = city;
    data['ZIP'] = zIP;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['register_type'] = registerType;
    data['profile_picture'] = profilePicture;
    data['user_groups'] = userGroups;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
