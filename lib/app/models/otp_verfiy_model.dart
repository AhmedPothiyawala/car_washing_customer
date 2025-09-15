class OtpVerfiyModel {
  bool? status;
  String? messageEn;
  String? messageDe;

  OtpVerfiyModel({this.status, this.messageEn, this.messageDe});

  OtpVerfiyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    return data;
  }
}
