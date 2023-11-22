class AppLink {
  // static const String server = "http://192.168.1.106/orop_ecommerce";
  static const String server =
      "https://sultankinggd.000webhostapp.com/orop_ecommerce";
  static const String imageststatic = "$server/upload";
  //Images ==================================================================
  static const String imagestServices = "$imageststatic/services";
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestProduct = "$imageststatic/products";
  static const String imageSpecialOffers = "$imageststatic/special_offers";
  // ===================== ====================
  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";
  static const String notificationread =
      "$server/notification/notification_read.php";
  static const String countnotification =
      "$server/notification/notificationcount.php";
  //=================================== Auth ================================/

  static const String isbrowseruser = "$server/auth/isbrowseruser.php";
  static const String signUp = "$server/auth/signup.php";
  static const String Login = "$server/auth/login.php";
  static const String verfiyCodeSignUp = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
  //=================================== ForgetPassword ================================/
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verfiycodeforgetpassword =
      "$server/forgetpassword/verfiycode.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";

  // Home
  static const String homepage = "$server/home.php";
  static const String subscribe = "$server/subscribe/subscribe.php";
  static const String unSubscribe = "$server/subscribe/unsubscribe.php";
  static const String checkSubscribe = "$server/subscribe/check.php";
  static const String getAllSubs = "$server/subscribe/getallsub.php";
  // HomeBrowsers
  // static const String homebrowsers = "$server/homebrowsers.php";
  //Prodect
  static const String categories = "$server/categories/view.php";
  static const String settings = "$server/categories/settings.php";
  static const String products = "$server/products/products.php";
  static const String searchProduct = "$server/products/search.php";
  // Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteformfavorite =
      "$server/favorite/deleteformfavorite.php";
  // Cart
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String deleteformcart = "$server/cart/deleteformcart.php";
  static const String deleteallcart = "$server/cart/deleteallcart.php";
  static const String deleteallQua = "$server/cart/deleteallquantity.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";
  static const String viewdrop = "$server/cart/viewdrop.php";
  // Coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  // Comments
  static const String comments = "$server/comments/view.php";
  static const String updateveiwedit = "$server/comments/updateviewedit.php";
  static const String addcomments = "$server/comments/add.php";
  static const String editcomments = "$server/comments/edit.php";
  static const String deletecomments = "$server/comments/delete.php";
  // Orders
  static const String receiptorders = "$server/orders/receiptoforders.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String detailsorders = "$server/orders/details.php";
  static const String archiveorders = "$server/orders/archive.php";
  static const String deleteorders = "$server/orders/delete.php";
  //
  static const String addcartCount = "$server/orders/add.php";
  static const String removecartCount = "$server/orders/remove.php";
  static const String removeexitcartCount = "$server/orders/removeexit.php";

  //rating
  static const String rating = "$server/rating.php";
  // Produc To Selling
  static const String producttoselling =
      "$server/products/producttopselling.php";
  //
  static const String offers = "$server/offers.php";

  // Admin Services ============================================================

  // categories
  static const String categoriesadd =
      "$server/adminservices/categories/add.php";
  static const String categoriesedit =
      "$server/adminservices/categories/edit.php";
  static const String categoriesdelete =
      "$server/adminservices/categories/delete.php";
  static const String categoriesview =
      "$server/adminservices/categories/view.php";
  //    
  static const String reportview = "$server/adminservices/products/report.php";
  static const String sendNotification = "$server/adminservices/sendNotification.php";
  // products
  static const String productsview = "$server/adminservices/products/view.php";
  static const String productsadd = "$server/adminservices/products/add.php";
  static const String productsedit = "$server/adminservices/products/edit.php";
  static const String productsdelete =
      "$server/adminservices/products/delete.php";
  // Orders adminservises
  static const String adminservisesapproveOrder =
      "$server/adminservices/orders/approve.php";
  static const String adminservisesprepareorders =
      "$server/adminservices/orders/prepare.php";

  static const String adminservisesviewarchiveorders =
      "$server/adminservices/orders/archive.php";
  static const String adminservisesdetailsorders =
      "$server/adminservices/orders/details.php";
  static const String adminservisesviewpendingorders =
      "$server/adminservices/orders/viewpending.php";
  static const String adminservisesviewacceptedorders =
      "$server/adminservices/orders/viewaccepted.php";

  //Upgrade to service API
  static const String serviceType = "$server/subscriptions/subscriptions.php";
  static const String orderService = "$server/subscriptions/upgrade.php";

  //coupon api
  static const String couponView = "$server/adminservices/coupon/view.php";
  static const String couponDelete = "$server/adminservices/coupon/delete.php";
  static const String couponadd = "$server/adminservices/coupon/add.php";

}
