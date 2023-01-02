import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoestore/config.dart';
import 'package:shoestore/flats.dart';
import 'package:shoestore/Products.dart';
import 'package:shoestore/home.dart';
import 'package:shoestore/models/categories_model.dart';
import 'package:shoestore/sandals.dart';
import 'package:shoestore/slippers.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  isLoaded? Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: categories!.categoryData!.length,
            itemBuilder: (context,index){
          
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> Products(categoryModel : categories!.categoryData![index]) ));
              },
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(16),

                  child:Row(
                    children: [

                      Text('${categories!.categoryData![index].categoryName}',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next, color: Colors.black),

                    ],
                  )

              ),
            ),
          );
        })
    ) : Center(child: CircularProgressIndicator(),);
  }
  
  Categories? categories;
  Future getCategories() async{
    var response = await Dio().get('${APIconfig.BASEURL}loadCategories.php');
    categories = Categories.fromJson(response.data);
    if(categories!.categoryData!.isNotEmpty){
      setState(() {
        isLoaded=true;
      });
    }else{
      isLoaded=false;
      var snackBar = SnackBar(
        content: Text(categories!.message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }


  }
}
