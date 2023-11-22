class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoriteProduct;
  String? favoriteSerid;
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
  String? usersId;
  String? servicesId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteProduct,
      this.favoriteSerid,
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
      this.usersId,
      this.servicesId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteProduct = json['favorite_product'];
    favoriteSerid = json['favorite_serid'];
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
    usersId = json['users_id'];
    servicesId = json['services_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_product'] = this.favoriteProduct;
    data['favorite_serid'] = this.favoriteSerid;
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
    data['users_id'] = this.usersId;
    data['services_id'] = this.servicesId;
    return data;
  }
}
