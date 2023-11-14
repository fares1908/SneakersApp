class AppLink {
  static const String server =
      "http://sneakerfaresstor.000webhostapp.com/sneakerapp";

  ///////////auth
  static const String login = "$server/auth/login.php";
  static const String signUp = "$server/auth/signup.php";
  static const String verifyCodeSignUp = "$server/auth/verfiycode.php";
  static const String resendCode = "$server/auth/resend.php";

  /////////////////////forgetpassword////////////////
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verifyCode = "$server/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";

  /////////////////////home..
  static const String home = "$server/home.php";

  ////////////////////category/////
  static const String nameCategories = "$server/categories/view.php";
  static const String imageItems = "$server/uploade/items";

  ////////search
  static const String search = "$server/items/search.php";
  static const String items = "$server/items/items.php";
////////////favourite
  static const String addFavourite = "$server/favorite/add.php";
  static const String removeFavourite = "$server/favorite/remove.php";
  static const String deleteFavourite = "$server/favorite/delete.php";
  static const String viewFavourite = "$server/favorite/view.php";
  /////////cart/////////////
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartFind = "$server/cart/find.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartRemove = "$server/cart/remove.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";
  // Address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  ///orders
  static const String checkout = "$server/orders/checkout.php";
  static const String orders = "$server/orders/orders.php";
  static const String notification = "$server/notification.php";
  static const String details = "$server/orders/details.php";
  static const String deleteOrder = "$server/orders/delete.php";
  static const String archive = "$server/orders/archive.php";
  static const String offer = "$server/offer.php";
}
