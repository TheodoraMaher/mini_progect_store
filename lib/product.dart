import 'package:flutter/material.dart';
import 'package:shoestore/cart.dart';
import 'package:shoestore/models/productsmodel.dart';

import 'config.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, required this.productModel}) : super(key: key);
  ProductsData productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
        title: Text('${widget.productModel.shoeName}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,

            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.productModel.shoeImages![0].shoeImage!,
              fit: BoxFit.fill,
              height: 300,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    widget.productModel.shoeName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.productModel.shoePrice!} L.E',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.productModel.shoeDesc!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20),
            //   child: Row(
            //     children: [
            //       Text(
            //         title[index],
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold, fontSize: 30),
            //       ),
            //       Spacer(),
            //       Container(
            //         height: 30,
            //         width: 30,
            //         color: Colors.black12,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: Icon(Icons.add, color: Colors.black),
            //         ),
            //       ),
            //       Text(
            //         '   ',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold, fontSize: 30),
            //       ),
            //       Container(
            //         height: 30,
            //         width: 30,
            //         color: Colors.black12,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: Icon(Icons.remove, color: Colors.black),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                cartItems.add(widget.productModel);
                var snackBar = SnackBar(
                  content: Text('Added To Cart Successfully'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('ADD TO CART',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.black)))),
            ),
          ],
        ),
      ),
    );
  }
}
