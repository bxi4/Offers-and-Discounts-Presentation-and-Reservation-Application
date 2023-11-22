class SpecialOffersModel {
  String? specialOffersId;
  String? specialOffersName;
  String? specialOffersImage;
  String? datetiem;

  SpecialOffersModel(
      {this.specialOffersId,
      this.specialOffersName,
      this.specialOffersImage,
      this.datetiem});

  SpecialOffersModel.fromJson(Map<String, dynamic> json) {
    specialOffersId = json['special_offers_id'];
    specialOffersName = json['special_offers_name'];
    specialOffersImage = json['special_offers_image'];
    datetiem = json['datetiem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['special_offers_id'] = this.specialOffersId;
    data['special_offers_name'] = this.specialOffersName;
    data['special_offers_image'] = this.specialOffersImage;
    data['datetiem'] = this.datetiem;
    return data;
  }
}
