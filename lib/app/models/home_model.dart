class HomeModel {
  bool? status;
  String? messageEn;
  String? messageDe;
  Configuration? configuration;

  HomeModel({this.status, this.messageEn, this.messageDe, this.configuration});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messageEn = json['message_en'];
    messageDe = json['message_de'];
    configuration = json['configuration'] != null
        ? Configuration.fromJson(json['configuration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message_en'] = messageEn;
    data['message_de'] = messageDe;
    if (configuration != null) {
      data['configuration'] = configuration!.toJson();
    }
    return data;
  }
}

class Configuration {
  BannerDetails? bannerDetails;
  List<ServicesList>? servicesList;
  List<OffersList>? offersList;

  Configuration({this.bannerDetails, this.servicesList, this.offersList});

  Configuration.fromJson(Map<String, dynamic> json) {
    bannerDetails = json['banner_details'] != null
        ? BannerDetails.fromJson(json['banner_details'])
        : null;
    if (json['services_list'] != null) {
      servicesList = <ServicesList>[];
      json['services_list'].forEach((v) {
        servicesList!.add(ServicesList.fromJson(v));
      });
    }
    if (json['offers_list'] != null) {
      offersList = <OffersList>[];
      json['offers_list'].forEach((v) {
        offersList!.add(OffersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bannerDetails != null) {
      data['banner_details'] = bannerDetails!.toJson();
    }
    if (servicesList != null) {
      data['services_list'] = servicesList!.map((v) => v.toJson()).toList();
    }
    if (offersList != null) {
      data['offers_list'] = offersList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerDetails {
  String? name;
  String? description;
  String? buttonText;
  String? image;

  BannerDetails({this.name, this.description, this.buttonText, this.image});

  BannerDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    buttonText = json['button_text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['button_text'] = buttonText;
    data['image'] = image;
    return data;
  }
}

class ServicesList {
  String? name;
  String? image;

  ServicesList({this.name, this.image});

  ServicesList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class OffersList {
  String? name;
  String? description;
  String? buttonText;
  String? image;

  OffersList({this.name, this.description, this.buttonText, this.image});

  OffersList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    buttonText = json['button_text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['button_text'] = buttonText;
    data['image'] = image;
    return data;
  }
}
