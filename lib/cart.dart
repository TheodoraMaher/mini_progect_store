import 'package:flutter/material.dart';
import 'package:shoestore/checkout.dart';
import 'package:shoestore/product.dart';

import 'config.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
        title: Text('Shopping Cart',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          cartItems.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                             child: Row(
                              children: [
                                Image.network(
                                  cartItems[index].shoeImages![0].shoeImage!,
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        cartItems.remove(cartItems[index]);
                                        setState(() {

                                        });
                                      },
                                        child:
                                            Text(cartItems[index].shoeName!)))
                              ],
                            ),
                          )),
                        );
                      }))
              : Center(
                  child: Text('No Items in Cart'),
                ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => checkout()));
            },
            child: Text('make check out',
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
    );
  }
}
