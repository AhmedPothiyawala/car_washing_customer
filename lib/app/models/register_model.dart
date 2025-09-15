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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    data['user_id'] = userId;
    return data;
  }
}
