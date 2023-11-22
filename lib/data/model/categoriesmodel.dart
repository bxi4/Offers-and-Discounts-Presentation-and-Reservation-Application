class CategoriesModel {
  String? tabledetailsId;
  String? tabledetailsServiId;
  String? tabledetailsCateId;
  String? tabledetailsProdId;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? servicesId;
  String? servicesName;
  String? servicesNameAr;
  String? servicesImage;
  String? servicesDate;

  CategoriesModel(
      {this.tabledetailsId,
      this.tabledetailsServiId,
      this.tabledetailsCateId,
      this.tabledetailsProdId,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.servicesId,
      this.servicesName,
      this.servicesNameAr,
      this.servicesImage,
      this.servicesDate});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    tabledetailsId = json['tabledetails_id'];
    tabledetailsServiId = json['tabledetails_servi_id'];
    tabledetailsCateId = json['tabledetails_cate_id'];
    tabledetailsProdId = json['tabledetails_prod_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesNameAr = json['services_name_ar'];
    servicesImage = json['services_image'];
    servicesDate = json['services_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tabledetails_id'] = this.tabledetailsId;
    data['tabledetails_servi_id'] = this.tabledetailsServiId;
    data['tabledetails_cate_id'] = this.tabledetailsCateId;
    data['tabledetails_prod_id'] = this.tabledetailsProdId;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['services_name_ar'] = this.servicesNameAr;
    data['services_image'] = this.servicesImage;
    data['services_date'] = this.servicesDate;
    return data;
  }
}
