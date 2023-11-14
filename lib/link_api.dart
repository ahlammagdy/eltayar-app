class AppLink {
  static const String server = "http://192.168.1.5/eltayar backend";
  static const String test = "$server/test.php";
  static const String singup = "$server/auth/singup.php";
  static const String login = "$server/auth/login.php";
  static const String home = "$server/home.php";
  static const String items = "$server/items/item_view.php";
  static const String categories = "$server/categories/category_view.php";
  static const String viewCard = "$server/card/view.php";
  static const String addCard = "$server/card/add.php";
  static const String deleteCard = "$server/card/delete.php";
  static const String cradCountItem = "$server/card/get_items_count.php";
  static const String search = "$server/items/search.php";
  static const String catSearch = "$server/categories/search.php";
  static const String orderAdd = "$server/orders/add.php";
  static const String waitingOrders = "$server/orders/waiting.php";
  static const String doneOrders = "$server/orders/done.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String archivedOrders = "$server/orders/archieve.php";

  static const String notifications = "$server/notifications.php";

  //---------------delivery app ----------------------
  static const String devViewWaiting = "$server/delivery/dev_view_waiting.php";
  static const String devViewRchieve = "$server/delivery/dev_view_archieve.php";
  static const String devTakeOreder = "$server/delivery/dev_take_order.php";
  static const String devOrderDone = "$server/delivery/order_done.php";
  static const String devprepare = "$server/delivery/prepare.php";
  static const String devAccepted = "$server/delivery/dev_accepted.php";
  static const String devOrderDetails =
      "$server/delivery/dev_order_details.php";

  //static const String devViewWaiting = "$server/delivery/dev_view_waiting.php";
}
