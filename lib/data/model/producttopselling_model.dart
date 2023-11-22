class ProductTopSellingModel {
  String? countproduct;
  String? cartId;
  String? cartSerid;
  String? cartCatid;
  String? cartProdid;
  String? cartUserid;
  String? cartOrders;
  String? productsId;
  String? productsName;
  String? productsNameAr;
  String? productsDesc;
  String? productsDescAr;
  String? productsImage;
  String? productsCount;
  String? productsActive;
  String? productsPrice;
  String? productsDiscount;
  String? productsDate;
  String? servicesId;
  String? servicesName;
  String? productprice;

  ProductTopSellingModel(
      {this.countproduct,
      this.cartId,
      this.cartSerid,
      this.cartCatid,
      this.cartProdid,
      this.cartUserid,
      this.cartOrders,
      this.productsId,
      this.productsName,
      this.productsNameAr,
      this.productsDesc,
      this.productsDescAr,
      this.productsImage,
      this.productsCount,
      this.productsActive,
      this.productsPrice,
      this.productsDiscount,
      this.productsDate,
      this.servicesId,
      this.servicesName,
      this.productprice});

  ProductTopSellingModel.fromJson(Map<String, dynamic> json) {
    countproduct = json['countproduct'];
    cartId = json['cart_id'];
    cartSerid = json['cart_serid'];
    cartCatid = json['cart_catid'];
    cartProdid = json['cart_prodid'];
    cartUserid = json['cart_userid'];
    cartOrders = json['cart_orders'];
    productsId = json['products_id'];
    productsName = json['products_name'];
    productsNameAr = json['products_name_ar'];
    productsDesc = json['products_desc'];
    productsDescAr = json['products_desc_ar'];
    productsImage = json['products_image'];
    productsCount = json['products_count'];
    productsActive = json['products_active'];
    productsPrice = json['products_price'];
    productsDiscount = json['products_discount'];
    productsDate = json['products_date'];
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    productprice = json['productprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countproduct'] = this.countproduct;
    data['cart_id'] = this.cartId;
    data['cart_serid'] = this.cartSerid;
    data['cart_catid'] = this.cartCatid;
    data['cart_prodid'] = this.cartProdid;
    data['cart_userid'] = this.cartUserid;
    data['cart_orders'] = this.cartOrders;
    data['products_id'] = this.productsId;
    data['products_name'] = this.productsName;
    data['products_name_ar'] = this.productsNameAr;
    data['products_desc'] = this.productsDesc;
    data['products_desc_ar'] = this.productsDescAr;
    data['products_image'] = this.productsImage;
    data['products_count'] = this.productsCount;
    data['products_active'] = this.productsActive;
    data['products_price'] = this.productsPrice;
    data['products_discount'] = this.productsDiscount;
    data['products_date'] = this.productsDate;
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['productprice'] = this.productprice;
    return data;
  }
}
