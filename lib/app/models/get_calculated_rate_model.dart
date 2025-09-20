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
        data!.add(new Data.fromJson(v));
      });
    }
    messageEn = json['message_en'];
    messageDe = json['message_de'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message_en'] = this.messageEn;
    data['message_de'] = this.messageDe;
    return data;
  }
}

class Data {
  int? carClassId;
  String? carClassTitleEn;
  String? carClassTitleDe;
  String? carClassImage;
  double? totalDistance;
  int? baseRate;
  int? baseRateWithOurFees;
  double? vatValue;
  int? ourFees;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_class_id'] = this.carClassId;
    data['car_class_title_en'] = this.carClassTitleEn;
    data['car_class_title_de'] = this.carClassTitleDe;
    data['car_class_image'] = this.carClassImage;
    data['total_distance'] = this.totalDistance;
    data['base_rate'] = this.baseRate;
    data['base_rate_with_our_fees'] = this.baseRateWithOurFees;
    data['vat_value'] = this.vatValue;
    data['our_fees'] = this.ourFees;
    return data;
  }
}
