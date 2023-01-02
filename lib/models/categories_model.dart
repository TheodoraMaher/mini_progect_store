class Categories {
  List<CategoryData>? categoryData;
  String? status;
  String? message;

  Categories({this.categoryData, this.status, this.message});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryData != null) {
      data['category_data'] =
          this.categoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CategoryData {
  int? categoryId;
  String? categoryName;
  String? categoryDesc;
  String? categoryImg;

  CategoryData(
      {this.categoryId,
        this.categoryName,
        this.categoryDesc,
        this.categoryImg});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDesc = json['category_desc'];
    categoryImg = json['category_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_desc'] = this.categoryDesc;
    data['category_img'] = this.categoryImg;
    return data;
  }
}
