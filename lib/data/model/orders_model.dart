class OrdersModel {
  String? ordersId;
  String? ordersSerid;
  String? ordersUsersid;
  String? ordersType;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersSername;
  String? ordersDatetime;

  OrdersModel(
      {this.ordersId,
      this.ordersSerid,
      // this.ordersProductsid,
      this.ordersUsersid,
      this.ordersType,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersSername,
      this.ordersDatetime});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersSerid = json['orders_serid'];
    // ordersProductsid = json['orders_productsid'];
    ordersUsersid = json['orders_usersid'];
    ordersType = json['orders_type'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersSername = json['orders_sername'];
    ordersDatetime = json['orders_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_serid'] = this.ordersSerid;
    // data['orders_productsid'] = this.ordersProductsid;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_type'] = this.ordersType;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_sername'] = this.ordersSername;
    data['orders_datetime'] = this.ordersDatetime;
    return data;
  }
}
