import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoestore/fav.dart';
import 'package:shoestore/product.dart';

import 'config.dart';
import 'models/categories_model.dart';
import 'models/productsmodel.dart';

class Products extends StatefulWidget {
  Products({Key? key, required this.categoryModel}) : super(key: key);
  CategoryData categoryModel;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    getProductsForCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
        title: Text('${widget.categoryModel.categoryName}',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: isLoaded? GridView.builder(
          itemCount: products!.productsData!.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> ProductDetails(productModel : products!.productsData![index]) ));

              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            products!
                                .productsData![index].shoeImages![0].shoeImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*.2,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => fav()));
                            },
                            icon: Icon(Icons.favorite, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products!.productsData![index].shoeName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    Text(
                      '${products!.productsData![index].shoePrice!} L.E',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (1 / 1.63),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          padding: EdgeInsets.all(10),
        ) : Center(child: CircularProgressIndicator(),),
      ),
    );
  }

  ProductModel? products;

  Future getProductsForCategory() async {
    var response = await Dio().get(
        '${APIconfig.BASEURL}getProductByCategory.php',
        queryParameters: {'shoe_category_id': widget.categoryModel.categoryId});
    products = ProductModel.fromJson(response.data);
    if (products!.productsData!.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    } else {
      isLoaded = false;
      var snackBar = SnackBar(
        content: Text(products!.message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
