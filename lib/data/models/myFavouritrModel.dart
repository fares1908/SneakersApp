class MyFavoriteModel {
  final String favoriteId ;
  final String favoriteUsersid ;
  final String favoriteItemsid ;
  final String itemsId ;
  final String itemsName ;
  final String itemsDesc ;
  final String itemsImage ;
  final String itemsCount ;
  final String itemsActive ;
  final String itemsPrice ;
  final String itemsDiscount ;
  final String itemsDate ;
  final String itemsCat ;
  final String usersId  ;


  MyFavoriteModel(
      {required this.favoriteId,
        required this.favoriteUsersid,
        required this.favoriteItemsid,
        required this.itemsId,
        required this.itemsName,
        required this.itemsDesc,
        required this.itemsImage,
        required this.itemsCount,
        required this.itemsActive,
        required this.itemsPrice,
        required this.itemsDiscount,
        required this.itemsDate,
        required this.itemsCat,
        required this.usersId});

  factory MyFavoriteModel.fromJson( json) {
    return MyFavoriteModel(
      favoriteId: json['favorite_id'],
      favoriteUsersid: json['favorite_usersid'],
      favoriteItemsid: json['favorite_itemsid'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsDesc: json['items_desc'],
      itemsImage: json['items_image'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      itemsPrice: json['items_price'],
      itemsDiscount: json['items_discount'],
      itemsDate: json['items_date'],
      itemsCat: json['items_cat'],
      usersId: json['users_id'],
    );
  }


}