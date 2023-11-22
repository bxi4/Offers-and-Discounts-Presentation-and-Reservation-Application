class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponSerid;
  String? couponCheck;
  String? couponExpiredate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponSerid,
      this.couponCheck,
      this.couponExpiredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    couponSerid = json['coupon_serid'];
    couponCheck = json['coupon_check'];
    couponExpiredate = json['coupon_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_serid'] = this.couponSerid;
    data['coupon_check'] = this.couponCheck;
    data['coupon_expiredate'] = this.couponExpiredate;
    return data;
  }
}
