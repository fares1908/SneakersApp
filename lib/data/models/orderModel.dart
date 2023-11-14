class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String ? ordersRating;
  String ? ordersNoterating;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersPaymentmethod,
        this.ordersStatus,
        this.ordersDatetime,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.ordersNoterating,
        this.ordersRating,
        this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    ordersNoterating=json['orders_noterating'];
    ordersRating=json['orders_rating'];
  }


}