class UserModel {
  int? status;
  String? message;
  UserData? userData;

  UserModel({this.status, this.message, this.userData});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? email;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? welcomeMessage;
  List<Memberships>? memberships;
  bool? membershipActive;
  String? membershipExpiredOn;
  bool? trialPeriodEnd;
  String? membershipRenewalDate;
  String? subscriptionType;
  String? paymentMethod;
  String? transactionIdForInAppPurchase;
  String? purchaseType;
  bool? isGoogleAppleLogin;
  bool? isNew;
  bool? hide_inductions_popup;
  bool? isEligibleFreeTrial;
  String? subscriptionDeviceId;
  String? accessToken;
  String? purchaseToken;
  String? transactionReceipt;
  bool? claimBenefits;
  String? userSessionId;
  String? userSessionType;
  int? sessionTime;
  int? thrivePopupStatus;
  String? sessionTimes;

  UserData(
      {this.id,
      this.email,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.welcomeMessage,
      this.memberships,
      this.membershipActive,
      this.membershipExpiredOn,
      this.trialPeriodEnd,
      this.membershipRenewalDate,
      this.subscriptionType,
      this.paymentMethod,
      this.transactionIdForInAppPurchase,
      this.purchaseType,
      this.isGoogleAppleLogin,
      this.isNew,
      this.hide_inductions_popup,
      this.isEligibleFreeTrial,
      this.subscriptionDeviceId,
      this.accessToken,
      this.purchaseToken,
      this.transactionReceipt,
      this.claimBenefits,
      this.userSessionId,
      this.userSessionType,
      this.sessionTime,
      this.thrivePopupStatus,
      this.sessionTimes});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['memberships'] != null) {
      memberships = <Memberships>[];
      json['memberships'].forEach((v) {
        memberships!.add(Memberships.fromJson(v));
      });
    }
    membershipActive = json['membership_active'];
    membershipExpiredOn = json['membership_expired_on'];
    trialPeriodEnd = json['trial_period_end'];
    membershipRenewalDate = json['membership_renewal_date'];
    subscriptionType = json['subscription_type'];
    paymentMethod = json['payment_method'];
    transactionIdForInAppPurchase = json['transaction_id_for_in_app_purchase'];
    purchaseType = json['purchase_type'];
    isGoogleAppleLogin = json['is_google_apple_login'];
    isNew = json['is_new'];
    hide_inductions_popup = json['hide_inductions_popup'];
    isEligibleFreeTrial = json['is_eligible_free_trial'];
    subscriptionDeviceId = json['subscription_device_id'];
    accessToken = json['access_token'];
    purchaseToken = json['purchase_token'];
    transactionReceipt = json['transaction_receipt'];
    claimBenefits = json['claim_benefits'];
    userSessionId = json['user_session_id'];
    userSessionType = json['user_session_type'];
    sessionTime = json['session_time'];
    welcomeMessage = json['welcome_message'];
    thrivePopupStatus = json['thrive_popup_status'];
    sessionTimes = json['sessionTimes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    if (memberships != null) {
      data['memberships'] = memberships!.map((v) => v.toJson()).toList();
    }
    data['membership_active'] = membershipActive;
    data['membership_expired_on'] = membershipExpiredOn;
    data['trial_period_end'] = trialPeriodEnd;
    data['membership_renewal_date'] = membershipRenewalDate;
    data['subscription_type'] = subscriptionType;
    data['payment_method'] = paymentMethod;
    data['transaction_id_for_in_app_purchase'] = transactionIdForInAppPurchase;
    data['purchase_type'] = purchaseType;
    data['is_google_apple_login'] = isGoogleAppleLogin;
    data['is_new'] = isNew;
    data['hide_inductions_popup'] = hide_inductions_popup;
    data['is_eligible_free_trial'] = isEligibleFreeTrial;
    data['subscription_device_id'] = subscriptionDeviceId;
    data['access_token'] = accessToken;
    data['purchase_token'] = purchaseToken;
    data['transaction_receipt'] = transactionReceipt;
    data['claim_benefits'] = claimBenefits;
    data['user_session_id'] = userSessionId;
    data['user_session_type'] = userSessionType;
    data['session_time'] = sessionTime;
    data['welcome_message'] = welcomeMessage;
    data['thrive_popup_status'] = thrivePopupStatus;
    data['sessionTimes'] = sessionTimes;
    return data;
  }
}

class Memberships {
  int? id;
  int? status;
  int? userId;
  String? subscriptionType;
  int? paymentId;
  String? membershipId;
  String? transactionId;
  String? purchaseType;
  String? renewalPaymentIds;
  String? invoiceNumber;
  String? membershipEnd;
  int? extendedBy;
  String? extendedAt;
  String? deviceId;
  String? accessToken;
  String? purchaseToken;
  String? transactionReceipt;
  String? couponCode;
  int? claimedBenefit;

  Memberships(
      {this.id,
      this.status,
      this.userId,
      this.subscriptionType,
      this.paymentId,
      this.membershipId,
      this.transactionId,
      this.purchaseType,
      this.renewalPaymentIds,
      this.invoiceNumber,
      this.membershipEnd,
      this.extendedBy,
      this.extendedAt,
      this.deviceId,
      this.accessToken,
      this.purchaseToken,
      this.transactionReceipt,
      this.couponCode,
      this.claimedBenefit});

  Memberships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    subscriptionType = json['subscription_type'];
    paymentId = json['payment_id'];
    membershipId = json['membership_id'];
    transactionId = json['transaction_id'];
    purchaseType = json['purchase_type'];
    renewalPaymentIds = json['renewal_payment_ids'];
    invoiceNumber = json['invoice_number'];
    membershipEnd = json['membership_end'];
    extendedBy = json['extended_by'];
    extendedAt = json['extended_at'];
    deviceId = json['device_id'];
    accessToken = json['access_token'];
    purchaseToken = json['purchase_token'];
    transactionReceipt = json['transaction_receipt'];
    couponCode = json['coupon_code'];
    claimedBenefit = json['claimed_benefit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['user_id'] = userId;
    data['subscription_type'] = subscriptionType;
    data['payment_id'] = paymentId;
    data['membership_id'] = membershipId;
    data['transaction_id'] = transactionId;
    data['purchase_type'] = purchaseType;
    data['renewal_payment_ids'] = renewalPaymentIds;
    data['invoice_number'] = invoiceNumber;
    data['membership_end'] = membershipEnd;
    data['extended_by'] = extendedBy;
    data['extended_at'] = extendedAt;
    data['device_id'] = deviceId;
    data['access_token'] = accessToken;
    data['purchase_token'] = purchaseToken;
    data['transaction_receipt'] = transactionReceipt;
    data['coupon_code'] = couponCode;
    data['claimed_benefit'] = claimedBenefit;
    return data;
  }
}
