class CheckSubscriptionModel {
  int? status;
  String? message;
  SubscriptionData? data;

  CheckSubscriptionModel({
    this.status,
    this.message,
    this.data,
  });

  factory CheckSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return CheckSubscriptionModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? SubscriptionData.fromJson(json['data'])
          : SubscriptionData.empty(),
    );
  }

  factory CheckSubscriptionModel.empty() {
    return CheckSubscriptionModel(
      status: 0,
      message: '',
      data: SubscriptionData.empty(),
    );
  }
}

class SubscriptionData {
  final bool membershipActive;
  final String membershipExpiredOn;
  final bool trialPeriodEnd;
  final String androidAppVersion;
  final String iosAppVersion;
  final bool forceShow;
  final FreeVersion freeVersion;

  SubscriptionData({
    required this.membershipActive,
    required this.membershipExpiredOn,
    required this.trialPeriodEnd,
    required this.androidAppVersion,
    required this.iosAppVersion,
    required this.forceShow,
    required this.freeVersion,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) {
    return SubscriptionData(
      membershipActive: json['membership_active'] ?? false,
      membershipExpiredOn: json['membership_expired_on'] ?? '',
      trialPeriodEnd: json['trial_period_end'] ?? false,
      androidAppVersion: json['android_app_version'] ?? '',
      iosAppVersion: json['ios_app_version'] ?? '',
      forceShow: json['force_show'] ?? false,
      freeVersion: json['free_version'] != null
          ? FreeVersion.fromJson(json['free_version'])
          : FreeVersion.empty(),
    );
  }

  factory SubscriptionData.empty() {
    return SubscriptionData(
      membershipActive: false,
      membershipExpiredOn: '',
      trialPeriodEnd: false,
      androidAppVersion: '',
      iosAppVersion: '',
      forceShow: false,
      freeVersion: FreeVersion.empty(),
    );
  }
}

class FreeVersion {
  final Map<String, String> treatmentCategory;
  final Map<String, String> treatments;
  final Map<String, String> inductions;
  final Map<String, String> endings;
  final Map<String, String> musics;
  final List<String> dailyBurbles;

  FreeVersion({
    required this.treatmentCategory,
    required this.treatments,
    required this.inductions,
    required this.endings,
    required this.musics,
    required this.dailyBurbles,
  });

  factory FreeVersion.fromJson(Map<String, dynamic> json) {
    return FreeVersion(
      treatmentCategory: (json['treatment_category'] is Map)
          ? Map<String, String>.from(json['treatment_category'])
          : {},
      treatments: (json['treatments'] is Map)
          ? Map<String, String>.from(json['treatments'])
          : {},
      inductions: (json['inductions'] is Map)
          ? Map<String, String>.from(json['inductions'])
          : {},
      endings: (json['endings'] is Map)
          ? Map<String, String>.from(json['endings'])
          : {},
      musics: (json['musics'] is Map)
          ? Map<String, String>.from(json['musics'])
          : {},
      dailyBurbles: (json['dailyburbles'] is List)
          ? List<String>.from(json['dailyburbles'])
          : [],
    );
  }

  factory FreeVersion.empty() {
    return FreeVersion(
      treatmentCategory: {},
      treatments: {},
      inductions: {},
      endings: {},
      musics: {},
      dailyBurbles: [],
    );
  }
}
