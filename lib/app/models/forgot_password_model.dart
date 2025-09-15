class ForgotPasswordModel {
  bool? status;
  int? userId;
  String? messageEn;
  String? messageDe;

  ForgotPasswordModel(
      {this.status, this.userId, this.messageEn, this.messageDe});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user_id'] = userId;
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    return data;
  }
}
