import 'package:eltayar/admin_app/admin_screens/admin_home_screen.dart';
import 'package:eltayar/admin_app/admin_screens/admin_more_screens.dart';
import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/delivery_app/dev_screens/dev_wait.dart';
import 'package:eltayar/delivery_app/dev_screens/home_screen_dev.dart';
import 'package:eltayar/delivery_app/dev_screens/orders_home.dart';
import 'package:eltayar/delivery_app/dev_screens/tayar_more.dart';
//import 'package:eltayar/testcode.dart';
import 'package:eltayar/view/screens/auth/forget_password.dart';
import 'package:eltayar/view/screens/auth/login_screen.dart';
import 'package:eltayar/view/screens/auth/reset_password.dart';
import 'package:eltayar/view/screens/auth/sing_varify_code.dart';
import 'package:eltayar/view/screens/auth/singup_screen.dart';
import 'package:eltayar/view/screens/auth/success_reset_password.dart.dart';
import 'package:eltayar/view/screens/auth/success_sinup.dart';
import 'package:eltayar/view/screens/auth/varify_code.dart';
import 'package:eltayar/view/screens/more.dart';
import 'package:eltayar/view/screens/home.dart';
import 'package:eltayar/view/screens/home_screen.dart';
import 'package:eltayar/view/screens/mycategories.dart';
import 'package:eltayar/view/screens/notifications.dart';
import 'package:eltayar/view/screens/onboarding_screen.dart';
import 'package:eltayar/view/screens/orders/archieved_orders.dart';
import 'package:eltayar/view/screens/orders/order_details.dart';
import 'package:eltayar/view/screens/product_details.dart';
import 'package:eltayar/view/screens/orders/waiting_orders.dart';
import 'package:eltayar/view/screens/reports.dart';
import 'package:eltayar/view/screens/all_tayars.dart';
import 'package:get/get.dart';

import 'core/middle_ware/middle_ware.dart';
import 'view/screens/adress.dart';
import 'view/screens/card.dart';
import 'view/screens/conenctus.dart';
import 'view/screens/myitems.dart';
import 'view/screens/landuage.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () => const TestCode()),
  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.singup, page: () => const SingUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.varifyCode, page: () => const VarifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSingup, page: () => const SuccessSingup()),
  GetPage(name: AppRoute.singVarifyCode, page: () => const SingVarifyCode()),
  GetPage(name: AppRoute.allTayars, page: () => const AllTayars()),
  GetPage(name: AppRoute.more, page: () => const MorePage()),
  GetPage(name: AppRoute.myItems, page: () => const MyItemsCat()),
  GetPage(name: AppRoute.myCategories, page: () => const MyCategories()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.reports, page: () => const Reports()),
  GetPage(name: AppRoute.card, page: () => const MyCard()),
  GetPage(name: AppRoute.address, page: () => const Address()),
  GetPage(name: AppRoute.archievedOrders, page: () => const ArchivedOrders()),
  GetPage(name: AppRoute.waitingOrders, page: () => const WaitingOrders()),
  GetPage(name: AppRoute.notifications, page: () => const NotificationPage()),
  GetPage(name: AppRoute.orderDetails, page: () => const OrderDetails()),

  // ---------delivery app -------------
  GetPage(name: AppRoute.conenctUs, page: () => const ConenctUs()),
  GetPage(name: AppRoute.devHomeScreen, page: () => const DevHomeScreen()),
  GetPage(name: AppRoute.waitingOrders, page: () => const DevWaitingOrders()),
  GetPage(name: AppRoute.devOrderHome, page: () => const DevOrderHome()),
  GetPage(name: AppRoute.tayarMore, page: () => const TayarMore()),

  // ---------admin app ---------------
  GetPage(name: AppRoute.adminHomeScreen, page: () => const AdminHomeScreen()),
  GetPage(name: AppRoute.adminMore, page: () => const AdminMorePage()),
];
