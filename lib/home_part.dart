import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoestore/Products.dart';

import 'package:shoestore/config.dart';
import 'package:shoestore/fav.dart';
import 'package:shoestore/product.dart';

import 'home.dart';
import 'models/productsmodel.dart';
import 'new.dart';

class HomePart extends StatefulWidget {
  const HomePart({Key? key}) : super(key: key);

  @override
  State<HomePart> createState() => _HomePartState();
}

class _HomePartState extends State<HomePart> {
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)),
            child: Form(
              child: TextFormField(keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(label: Text('Search'),
                    suffixIcon: Icon(Icons.search)
                ),
              ),),
          ),
          Container(

            width: double.infinity,
            height: 190,
            child: TextButton(onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => neww()));
            },
              child: Image.asset('assets/images/d.png', width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.black)
                      )
                  )
              ),
            ),
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: isLoaded? GridView.builder(
                itemCount: productss!.productsData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> ProductDetails(productModel : productss!.productsData![index]) ));

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
                                  productss!
                                      .productsData![index].shoeImages![0].shoeImage!,
                                  fit: BoxFit.fill,
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
                              productss!.productsData![index].shoeName!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          Text(
                            '${productss!.productsData![index].shoePrice!} L.E',
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
                  childAspectRatio: (1 / 1.7),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,

              ) : Center(child: CircularProgressIndicator(),),
            ),
          ),


        ]

    );
  }
  ProductModel? productss;
  Future getProducts() async {
    var response = await Dio().get(
        '${APIconfig.BASEURL}loadAllProducts.php');
    productss = ProductModel.fromJson(response.data);
    if (productss!.productsData!.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    } else {
      isLoaded = false;
      var snackBar = SnackBar(
        content: Text(productss!.message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
