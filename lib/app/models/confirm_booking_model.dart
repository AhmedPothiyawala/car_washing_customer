class ConfirmBookingModel {
  bool? status;
  String? messageEn;
  String? messageDe;
  List<Bookings>? bookings;

  ConfirmBookingModel(
      {this.status, this.messageEn, this.messageDe, this.bookings});

  ConfirmBookingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messageEn = json['message_en'];
    messageDe = json['message_de'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message_en'] = this.messageEn;
    data['message_de'] = this.messageDe;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? id;
  String? bookingId;
  int? userId;
  String? service;
  int? carClassId;
  String? transferType;
  String? bookingDate;
  String? bookingTime;
  String? pickupPoints;
  String? dropPoints;
  String? totalDistance;
  String? baseRate;
  String? vatValue;
  String? ourFees;
  String? customerName;
  String? customerSurname;
  String? customerEmail;
  String? customerPhone;
  String? customerRemarks;
  String? billingCompanyName;
  String? billingSupplement;
  String? billingStreetNo;
  String? billingPlace;
  String? billingAddress;
  String? billingCanton;
  String? billingPostalCode;
  String? billingLand;
  String? dispatcherName;
  String? dispatcherPhone;
  String? dispatcherOrderNumber;
  String? customerName2;
  String? customerPhone2;
  String? status;
  Null? cancelReason;
  String? createdAt;
  String? updatedAt;
  String? carClassTitleEn;
  String? carClassTitleDe;
  String? remainingTime;

  Bookings(
      {this.id,
        this.bookingId,
        this.userId,
        this.service,
        this.carClassId,
        this.transferType,
        this.bookingDate,
        this.bookingTime,
        this.pickupPoints,
        this.dropPoints,
        this.totalDistance,
        this.baseRate,
        this.vatValue,
        this.ourFees,
        this.customerName,
        this.customerSurname,
        this.customerEmail,
        this.customerPhone,
        this.customerRemarks,
        this.billingCompanyName,
        this.billingSupplement,
        this.billingStreetNo,
        this.billingPlace,
        this.billingAddress,
        this.billingCanton,
        this.billingPostalCode,
        this.billingLand,
        this.dispatcherName,
        this.dispatcherPhone,
        this.dispatcherOrderNumber,
        this.customerName2,
        this.customerPhone2,
        this.status,
        this.cancelReason,
        this.createdAt,
        this.updatedAt,
        this.carClassTitleEn,
        this.carClassTitleDe,
        this.remainingTime});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    userId = json['user_id'];
    service = json['service'];
    carClassId = json['car_class_id'];
    transferType = json['transfer_type'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    pickupPoints = json['pickup_points'];
    dropPoints = json['drop_points'];
    totalDistance = json['total_distance'];
    baseRate = json['base_rate'];
    vatValue = json['vat_value'];
    ourFees = json['our_fees'];
    customerName = json['customer_name'];
    customerSurname = json['customer_surname'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    customerRemarks = json['customer_remarks'];
    billingCompanyName = json['billing_company_name'];
    billingSupplement = json['billing_supplement'];
    billingStreetNo = json['billing_street_no'];
    billingPlace = json['billing_place'];
    billingAddress = json['billing_address'];
    billingCanton = json['billing_canton'];
    billingPostalCode = json['billing_postal_code'];
    billingLand = json['billing_land'];
    dispatcherName = json['dispatcher_name'];
    dispatcherPhone = json['dispatcher_phone'];
    dispatcherOrderNumber = json['dispatcher_order_number'];
    customerName2 = json['customer_name2'];
    customerPhone2 = json['customer_phone2'];
    status = json['status'];
    cancelReason = json['cancel_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    carClassTitleEn = json['car_class_title_en'];
    carClassTitleDe = json['car_class_title_de'];
    remainingTime = json['remaining_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['user_id'] = this.userId;
    data['service'] = this.service;
    data['car_class_id'] = this.carClassId;
    data['transfer_type'] = this.transferType;
    data['booking_date'] = this.bookingDate;
    data['booking_time'] = this.bookingTime;
    data['pickup_points'] = this.pickupPoints;
    data['drop_points'] = this.dropPoints;
    data['total_distance'] = this.totalDistance;
    data['base_rate'] = this.baseRate;
    data['vat_value'] = this.vatValue;
    data['our_fees'] = this.ourFees;
    data['customer_name'] = this.customerName;
    data['customer_surname'] = this.customerSurname;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['customer_remarks'] = this.customerRemarks;
    data['billing_company_name'] = this.billingCompanyName;
    data['billing_supplement'] = this.billingSupplement;
    data['billing_street_no'] = this.billingStreetNo;
    data['billing_place'] = this.billingPlace;
    data['billing_address'] = this.billingAddress;
    data['billing_canton'] = this.billingCanton;
    data['billing_postal_code'] = this.billingPostalCode;
    data['billing_land'] = this.billingLand;
    data['dispatcher_name'] = this.dispatcherName;
    data['dispatcher_phone'] = this.dispatcherPhone;
    data['dispatcher_order_number'] = this.dispatcherOrderNumber;
    data['customer_name2'] = this.customerName2;
    data['customer_phone2'] = this.customerPhone2;
    data['status'] = this.status;
    data['cancel_reason'] = this.cancelReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['car_class_title_en'] = this.carClassTitleEn;
    data['car_class_title_de'] = this.carClassTitleDe;
    data['remaining_time'] = this.remainingTime;
    return data;
  }
}
