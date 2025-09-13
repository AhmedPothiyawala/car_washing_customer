class RegisterModel {
  bool? status;
  String? messageEn;
  String? messageDe;
  int? userId;

  RegisterModel({this.status, this.messageEn, this.messageDe, this.userId});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messageEn = json['message_en'];
    messageDe = json['message_de'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message_en'] = this.messageEn;
    data['message_de'] = this.messageDe;
    data['user_id'] = this.userId;
    return data;
  }
}
