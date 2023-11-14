class CartModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? cartOrders;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsActive;
  String? itemsCount;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? itemsId;
  int ?isCart;

  CartModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.cartOrders,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsActive,
        this.itemsCount,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.isCart,
        this.itemsId});

  CartModel.fromJson(Map<String, dynamic> json) {
    isCart=json['isCart'];
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsId = json['items_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_count'] = this.itemsCount;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['items_id'] = this.itemsId;
    return data;
  }
}
