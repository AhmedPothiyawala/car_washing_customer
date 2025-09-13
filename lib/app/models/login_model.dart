class LoginModel {
  bool? status;
  User? user;
  String? messageEn;
  String? messageDe;

  LoginModel({this.status, this.user, this.messageEn, this.messageDe});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message_en'] = this.messageEn;
    data['message_de'] = this.messageDe;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['address'] = this.address;
    data['number'] = this.number;
    data['DOB'] = this.dOB;
    data['city'] = this.city;
    data['ZIP'] = this.zIP;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['register_type'] = this.registerType;
    data['profile_picture'] = this.profilePicture;
    data['user_groups'] = this.userGroups;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
