import 'package:shoestore/models/productsmodel.dart';
import 'package:shoestore/models/user_model.dart';
import 'package:shoestore/product.dart';

class APIconfig {
 static const String BASEURL ='https://theo-task.ahmed-ayman.dev/api/';
}
user? globalUserModel;
List<ProductsData> cartItems = [];