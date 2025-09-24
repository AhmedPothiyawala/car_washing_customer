class GetCalculatedRateModel {
  bool? success;
  List<Data>? data;
  String? messageEn;
  String? messageDe;

  GetCalculatedRateModel(
      {this.success, this.data, this.messageEn, this.messageDe});

  GetCalculatedRateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    return data;
  }
}

class Data {
  int? carClassId;
  String? carClassTitleEn;
  String? carClassTitleDe;
  String? carClassImage;
  double? totalDistance;
  double? baseRate;
  double? baseRateWithOurFees;
  double? vatValue;
  double? ourFees;

  Data(
      {this.carClassId,
      this.carClassTitleEn,
      this.carClassTitleDe,
      this.carClassImage,
      this.totalDistance,
      this.baseRate,
      this.baseRateWithOurFees,
      this.vatValue,
      this.ourFees});

  Data.fromJson(Map<String, dynamic> json) {
    carClassId = json['car_class_id'];
    carClassTitleEn = json['car_class_title_en'];
    carClassTitleDe = json['car_class_title_de'];
    carClassImage = json['car_class_image'];
    totalDistance = json['total_distance'];
    baseRate = json['base_rate'];
    baseRateWithOurFees = json['base_rate_with_our_fees'];
    vatValue = json['vat_value'];
    ourFees = json['our_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['car_class_id'] = carClassId;
    data['car_class_title_en'] = carClassTitleEn;
    data['car_class_title_de'] = carClassTitleDe;
    data['car_class_image'] = carClassImage;
    data['total_distance'] = totalDistance;
    data['base_rate'] = baseRate;
    data['base_rate_with_our_fees'] = baseRateWithOurFees;
    data['vat_value'] = vatValue;
    data['our_fees'] = ourFees;
    return data;
  }
}
