// class CartModel {
//   String? cartId;
//   String? cartSerid;
//   String? cartProdid;
//   String? cartUserid;
//   String? count;
//   String? productsId;
//   String? productsName;
//   String? productsNameAr;
//   String? productsDesc;
//   String? productsDescAr;
//   String? productsImage;
//   String? productsCount;
//   String? productsActive;
//   String? productsPrice;
//   String? productsDiscount;
//   String? productsDate;
//   String? usersId;
//   String? servicesId;
//   String? servicesName;

//   CartModel(
//       {this.cartId,
//       this.cartSerid,
//       this.cartProdid,
//       this.cartUserid,
//       this.count,
//       this.productsId,
//       this.productsName,
//       this.productsNameAr,
//       this.productsDesc,
//       this.productsDescAr,
//       this.productsImage,
//       this.productsCount,
//       this.productsActive,
//       this.productsPrice,
//       this.productsDiscount,
//       this.productsDate,
//       this.usersId,
//       this.servicesId,
//       this.servicesName});

//   CartModel.fromJson(Map<String, dynamic> json) {
//     cartId = json['cart_id'];
//     cartSerid = json['cart_serid'];
//     cartProdid = json['cart_prodid'];
//     cartUserid = json['cart_userid'];
//     count = json['count'];
//     productsId = json['products_id'];
//     productsName = json['products_name'];
//     productsNameAr = json['products_name_ar'];
//     productsDesc = json['products_desc'];
//     productsDescAr = json['products_desc_ar'];
//     productsImage = json['products_image'];
//     productsCount = json['products_count'];
//     productsActive = json['products_active'];
//     productsPrice = json['products_price'];
//     productsDiscount = json['products_discount'];
//     productsDate = json['products_date'];
//     usersId = json['users_id'];
//     servicesId = json['services_id'];
//     servicesName = json['services_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cart_id'] = this.cartId;
//     data['cart_serid'] = this.cartSerid;
//     data['cart_prodid'] = this.cartProdid;
//     data['cart_userid'] = this.cartUserid;
//     data['count'] = this.count;
//     data['products_id'] = this.productsId;
//     data['products_name'] = this.productsName;
//     data['products_name_ar'] = this.productsNameAr;
//     data['products_desc'] = this.productsDesc;
//     data['products_desc_ar'] = this.productsDescAr;
//     data['products_image'] = this.productsImage;
//     data['products_count'] = this.productsCount;
//     data['products_active'] = this.productsActive;
//     data['products_price'] = this.productsPrice;
//     data['products_discount'] = this.productsDiscount;
//     data['products_date'] = this.productsDate;
//     data['users_id'] = this.usersId;
//     data['services_id'] = this.servicesId;
//     data['services_name'] = this.servicesName;
//     return data;
//   }
// }

class CartModel {
  String? productprice;
  String? countiproduct;
  String? cartId;
  String? cartSerid;
  String? cartCatid;
  String? cartProdid;
  String? cartUserid;
  String? cartOrders;
  String? cartCount;
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
  String? usersId;
  String? categoriesId;
  String? categoriesName;
  String? servicesId;
  String? servicesName;

  CartModel({
    this.productprice,
    this.countiproduct,
    this.cartId,
    this.cartSerid,
    this.cartCatid,
    this.cartProdid,
    this.cartUserid,
    this.cartOrders,
    this.cartCount,
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
    this.usersId,
    this.categoriesId,
    this.categoriesName,
    this.servicesId,
    this.servicesName,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    productprice = json['productprice'];
    countiproduct = json['countiproduct'];
    cartId = json['cart_id'];
    cartSerid = json['cart_serid'];
    cartCatid = json['cart_catid'];
    cartProdid = json['cart_prodid'];
    cartUserid = json['cart_userid'];
    cartOrders = json['cart_orders'];
    cartCount = json['cart_count'];
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
    usersId = json['users_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    servicesId = json['services_id'];
    servicesName = json['services_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productprice'] = this.productprice;
    data['countiproduct'] = this.countiproduct;
    data['cart_id'] = this.cartId;
    data['cart_serid'] = this.cartSerid;
    data['cart_catid'] = this.cartCatid;
    data['cart_prodid'] = this.cartProdid;
    data['cart_userid'] = this.cartUserid;
    data['cart_orders'] = this.cartOrders;
    data['cart_count'] = this.cartCount;
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
    data['users_id'] = this.usersId;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    return data;
  }
}
