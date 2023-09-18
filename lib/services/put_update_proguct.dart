
import 'dart:convert';

import 'package:http/http.dart%20' as http;
import 'package:store_app/api_services/api.dart';
import 'package:store_app/models/product_model.dart';

class UbdateProductService{
//
// Future<ProductModel> updateProduct ({
//   required String title,
//   required String price,
//   required String description,
//   required String image,
//   required String category,required String id})async {
//   http.Response response = await http.put(
//     Uri.parse('https://fakestoreapi.com/products/$id'),
//     body: {
//       'title': title,
//       'price': price,
//       'description': description,
//       'image': image,
//       'category': category
//     }, headers: {
//     'Content-Type': 'application/x-www-form-urlencoded'
//   },
//
//   );
// // print(response.body);
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = jsonDecode(response.body);
//
//     return ProductModel.fromJson(data);
//   } else {
//     throw Exception(
//         'Failed to update Product. status code ${response.statusCode}');
//   }
// }


Future<ProductModel> updateProduct({ required String title,
  required String price,
  required String description,
  required String image,
  required String category,
  required int id})async
{
  print('id =$id');
 Map<String,dynamic> data = await Api().put(url:'https://fakestoreapi.com/products/$id' ///// problem here
     , body: {
   'id' : id,
  'title': title,
  'price': price,
  'description': description,
  'image':image,
  'category': category
  });
 return ProductModel.fromJson(data);
}










}

