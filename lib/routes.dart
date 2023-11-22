import 'package:get/get.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/shared/onboarding.dart';
import 'package:orop/view/admin_services/home_screen.dart';
import 'package:orop/view/admin_services/orders/details.dart';
import 'package:orop/view/admin_services/products/add.dart';
import 'package:orop/view/admin_services/products/edit.dart';
import 'package:orop/view/admin_services/products/report.dart';
import 'package:orop/view/admin_services/products/view.dart';
import 'package:orop/view/comment/comment.dart';
import 'package:orop/view/comment/edit.dart';
import 'package:orop/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:orop/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:orop/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:orop/view/screen/auth/forgetpassword/success_signup.dart';
import 'package:orop/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:orop/view/screen/auth/forgetpassword/verfiycodesignup.dart';
import 'package:orop/view/screen/auth/login.dart';
import 'package:orop/view/screen/auth/signup.dart';
import 'package:orop/view/screen/cart_screen.dart';
import 'package:orop/view/screen/checkout.dart';
import 'package:orop/view/screen/home.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/screen/homecategories.dart';
import 'package:orop/view/screen/homescreen.dart';
import 'package:orop/view/screen/myfavorite.dart';
import 'package:orop/view/screen/notification.dart';
import 'package:orop/view/screen/offers.dart';
import 'package:orop/view/screen/orders/archive.dart';
import 'package:orop/view/screen/orders/details.dart';
import 'package:orop/view/screen/orders/pending.dart';
import 'package:orop/view/screen/product.dart';
import 'package:orop/view/screen/productdetails.dart';
import 'package:orop/view/screen/upgradetoservice_screen.dart';
import 'package:orop/view/widget/onboarding/bordingBrowsers.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/admin_services/orders/orderscreen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () => const Login()),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(
      name: AppRoute.upgradetoservice,
      page: () => const UpgradeToServiceScreen()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onbording, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.homeServer, page: () => const HomeScreen()),
  GetPage(name: AppRoute.categoris, page: () => const HomeGategories()),
  GetPage(name: AppRoute.product, page: () => const Products()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorit()),
  //GetPage(name: AppRoute.myprofile, page: () => const MyProfile()),
  GetPage(name: AppRoute.cartscreen, page: () => const CartScreen()),
  //
  GetPage(name: AppRoute.search, page: () => const Search()),
  GetPage(name: AppRoute.comment, page: () => const Comments()),
  GetPage(name: AppRoute.edit, page: () => const Edit()),
  GetPage(name: AppRoute.notification, page: () => const NotificationView()),
  GetPage(name: AppRoute.receiptorders, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  //
  GetPage(name: AppRoute.offersview, page: () => const OffersView()),
  // Admin_Services ===========================================================
  GetPage(name: AppRoute.homescreenadmin, page: () => const HomeScreenAdmin()),

  // Categories

  /*GetPage(
      name: AppRoute.adminservicescategoriesview,
      page: () => const AdminServicesCategoriesView()),
  GetPage(
      name: AppRoute.adminservicescategoriesadd,
      page: () => const AdminServicesCategoriesAdd()),
  GetPage(
      name: AppRoute.adminservicescategoriesedit,
      page: () => const AdminServicesCategoriesEdit()),*/

  // Products
  GetPage(
      name: AppRoute.adminservicesproductsview,
      page: () => const AdminServicesProductsView()),
  GetPage(
      name: AppRoute.adminservicesproductsadd,
      page: () => const AdminServicesProductsAdd()),
  GetPage(
      name: AppRoute.adminservicesproductsedit,
      page: () => const AdminServicesProductsEdit()),
  // orders
  GetPage(
      name: AppRoute.adminservicesorderscreen,
      page: () => const AdminServicesOrderScreen()),
  GetPage(
      name: AppRoute.adminservicesordersdetails,
      page: () => const AdminServicesOrdersDetails()),

  //
  // GetPage(name: AppRoute.homebrowsers, page: () => const HomeBrowsers()),
  GetPage(name: AppRoute.bordingbrowsers, page: () => const Browsersbording()),
  GetPage(name: AppRoute.reportview, page: () => const reportView()),
  //
];
