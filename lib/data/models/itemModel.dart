class ItemModel {
  String? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  String? itemsCount;
  String? itemsDiscount;
  String? itemsPrice;
  String? itemsDate;
  String? itemsActive;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesDatetime;
 int ? favorite;
  int ?isCart;

  ItemModel(
      {this.itemsId,
        this.isCart,
        this.itemsName,
        this.itemsDesc,
        this.itemsImage,
        this.itemsCount,
        this.itemsDiscount,
        this.itemsPrice,
        this.itemsDate,
        this.itemsActive,
        this.itemsCat,
        this.categoriesId,
        this.categoriesName,
        this.categoriesDatetime,
        this.favorite});

  ItemModel.fromJson( json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsDiscount = json['items_discount'];
    itemsPrice = json['items_price'];
    itemsDate = json['items_date'];
    itemsActive = json['items_active'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    isCart=json['isCart'];
  }


}
