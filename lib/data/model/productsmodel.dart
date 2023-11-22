/*class ProductsModel {
  String? tabledetailsId;
  String? tabledetailsServiId;
  String? tabledetailsCateId;
  String? tabledetailsProdId;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? productsId;
  String? productsName;
  String? productsNameAr;
  String? productsDesc;
  String? productsDescAr;
  String? productsImage;
  String? productsCount;
  String? productsActive;
  String? productsPrice;
  String? productsPriceDiscount;
  String? productsDiscount;
  String? productsDate;
  String? servicesId;
  String? servicesName;
  String? favorite;

  ProductsModel({
    this.tabledetailsId,
    this.tabledetailsServiId,
    this.tabledetailsCateId,
    this.tabledetailsProdId,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.productsId,
    this.productsName,
    this.productsNameAr,
    this.productsDesc,
    this.productsDescAr,
    this.productsImage,
    this.productsCount,
    this.productsActive,
    this.productsPrice,
    this.productsPriceDiscount,
    this.productsDiscount,
    this.productsDate,
    this.servicesId,
    this.servicesName,
    this.favorite,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    tabledetailsId = json['tabledetails_id'];
    tabledetailsServiId = json['tabledetails_servi_id'];
    tabledetailsCateId = json['tabledetails_cate_id'];
    tabledetailsProdId = json['tabledetails_prod_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    productsId = json['products_id'];
    productsName = json['products_name'];
    productsNameAr = json['products_name_ar'];
    productsDesc = json['products_desc'];
    productsDescAr = json['products_desc_ar'];
    productsImage = json['products_image'];
    productsCount = json['products_count'];
    productsActive = json['products_active'];
    productsPrice = json['products_price'];
    productsPriceDiscount = json['productpricecount'];
    productsDiscount = json['products_discount'];
    productsDate = json['products_date'];
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesName = json['favorite'];
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
    data['products_id'] = this.productsId;
    data['products_name'] = this.productsName;
    data['products_name_ar'] = this.productsNameAr;
    data['products_desc'] = this.productsDesc;
    data['products_desc_ar'] = this.productsDescAr;
    data['products_image'] = this.productsImage;
    data['products_count'] = this.productsCount;
    data['products_active'] = this.productsActive;
    data['products_price'] = this.productsPrice;
    data['productpricecount'] = this.productsPriceDiscount;
    data['products_discount'] = this.productsDiscount;
    data['products_date'] = this.productsDate;
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['favorite'] = this.favorite;
    return data;
  }
}*/
class ProductsModel {
  String? tabledetailsId;
  String? tabledetailsServiId;
  String? tabledetailsCateId;
  String? tabledetailsProdId;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? productsId;
  String? productsName;
  String? productsNameAr;
  String? productsDesc;
  String? productsDescAr;
  String? productsImage;
  String? productsCount;
  String? productsActive;
  String? productsPrice;
  String? productsPriceDiscount;
  String? productsDiscount;
  String? productsDate;
  String? servicesId;
  String? servicesName;
  String? servicesImage;
  String? favorite;
  String? productpricecount;

  ProductsModel(
      {this.tabledetailsId,
      this.tabledetailsServiId,
      this.tabledetailsCateId,
      this.tabledetailsProdId,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.productsId,
      this.productsName,
      this.productsNameAr,
      this.productsDesc,
      this.productsDescAr,
      this.productsImage,
      this.productsCount,
      this.productsActive,
      this.productsPrice,
      this.productsPriceDiscount,
      this.productsDiscount,
      this.productsDate,
      this.servicesId,
      this.servicesName,
      this.servicesImage,
      this.favorite,
      this.productpricecount});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    tabledetailsId = json['tabledetails_id'];
    tabledetailsServiId = json['tabledetails_servi_id'];
    tabledetailsCateId = json['tabledetails_cate_id'];
    tabledetailsProdId = json['tabledetails_prod_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    productsId = json['products_id'];
    productsName = json['products_name'];
    productsNameAr = json['products_name_ar'];
    productsDesc = json['products_desc'];
    productsDescAr = json['products_desc_ar'];
    productsImage = json['products_image'];
    productsCount = json['products_count'];
    productsActive = json['products_active'];
    productsPrice = json['products_price'];
    productsPriceDiscount = json['productpricecount'];
    productsDiscount = json['products_discount'];
    productsDate = json['products_date'];
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesImage = json['services_image'];
    favorite = json['favorite'];
    productpricecount = json['productpricecount'];
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
    data['products_id'] = this.productsId;
    data['products_name'] = this.productsName;
    data['products_name_ar'] = this.productsNameAr;
    data['products_desc'] = this.productsDesc;
    data['products_desc_ar'] = this.productsDescAr;
    data['products_image'] = this.productsImage;
    data['products_count'] = this.productsCount;
    data['products_active'] = this.productsActive;
    data['products_price'] = this.productsPrice;
    data['productpricecount'] = this.productsPriceDiscount;
    data['products_discount'] = this.productsDiscount;
    data['products_date'] = this.productsDate;
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['services_image'] = this.servicesImage;
    data['favorite'] = this.favorite;
    data['productpricecount'] = this.productpricecount;
    return data;
  }
}
