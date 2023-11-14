class CategoryModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesDatetime;

  CategoryModel(
      {this.categoriesId, this.categoriesName, this.categoriesDatetime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
