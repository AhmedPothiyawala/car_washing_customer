class CancelBookingModel {
  bool? status;
  String? bookingId;
  String? messageEn;
  String? messageDe;

  CancelBookingModel(
      {this.status, this.bookingId, this.messageEn, this.messageDe});

  CancelBookingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    bookingId = json['booking_id'];
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['booking_id'] = bookingId;
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    return data;
  }
}
