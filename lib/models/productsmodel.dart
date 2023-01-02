class ProductModel {
  List<ProductsData>? productsData;
  String? status;
  String? message;

  ProductModel({this.productsData, this.status, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products_data'] != null) {
      productsData = <ProductsData>[];
      json['products_data'].forEach((v) {
        productsData!.add(new ProductsData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsData != null) {
      data['products_data'] =
          this.productsData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ProductsData {
  int? shoeId;
  String? shoeName;
  int? shoePrice;
  String? shoeDesc;
  int? shoeCategoryId;
  String? categoryName;
  List<ShoeImages>? shoeImages;

  ProductsData(
      {this.shoeId,
        this.shoeName,
        this.shoePrice,
        this.shoeDesc,
        this.shoeCategoryId,
        this.categoryName,
        this.shoeImages});

  ProductsData.fromJson(Map<String, dynamic> json) {
    shoeId = json['shoe_id'];
    shoeName = json['shoe_name'];
    shoePrice = json['shoe_price'];
    shoeDesc = json['shoe_desc'];
    shoeCategoryId = json['shoe_category_id'];
    categoryName = json['category_name'];
    if (json['shoe_images'] != null) {
      shoeImages = <ShoeImages>[];
      json['shoe_images'].forEach((v) {
        shoeImages!.add(new ShoeImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shoe_id'] = this.shoeId;
    data['shoe_name'] = this.shoeName;
    data['shoe_price'] = this.shoePrice;
    data['shoe_desc'] = this.shoeDesc;
    data['shoe_category_id'] = this.shoeCategoryId;
    data['category_name'] = this.categoryName;
    if (this.shoeImages != null) {
      data['shoe_images'] = this.shoeImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShoeImages {
  String? shoeImageId;
  String? shoeImage;
  String? shoeId;

  ShoeImages({this.shoeImageId, this.shoeImage, this.shoeId});

  ShoeImages.fromJson(Map<String, dynamic> json) {
    shoeImageId = json['shoe_image_id'];
    shoeImage = json['shoe_image'];
    shoeId = json['shoe_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shoe_image_id'] = this.shoeImageId;
    data['shoe_image'] = this.shoeImage;
    data['shoe_id'] = this.shoeId;
    return data;
  }
}
