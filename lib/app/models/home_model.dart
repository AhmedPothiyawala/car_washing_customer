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
        ? new Configuration.fromJson(json['configuration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message_en'] = this.messageEn;
    data['message_de'] = this.messageDe;
    if (this.configuration != null) {
      data['configuration'] = this.configuration!.toJson();
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
        ? new BannerDetails.fromJson(json['banner_details'])
        : null;
    if (json['services_list'] != null) {
      servicesList = <ServicesList>[];
      json['services_list'].forEach((v) {
        servicesList!.add(new ServicesList.fromJson(v));
      });
    }
    if (json['offers_list'] != null) {
      offersList = <OffersList>[];
      json['offers_list'].forEach((v) {
        offersList!.add(new OffersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerDetails != null) {
      data['banner_details'] = this.bannerDetails!.toJson();
    }
    if (this.servicesList != null) {
      data['services_list'] =
          this.servicesList!.map((v) => v.toJson()).toList();
    }
    if (this.offersList != null) {
      data['offers_list'] = this.offersList!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['button_text'] = this.buttonText;
    data['image'] = this.image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['button_text'] = this.buttonText;
    data['image'] = this.image;
    return data;
  }
}
