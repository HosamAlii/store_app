import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
    if(response.statusCode == 200){
    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> categoriesList = [];
    for (int i = 0; i < data.length; i++) {
      categoriesList.add(ProductModel.fromJson(data[i]));
    }
    return categoriesList;
  }else {
      throw Exception('There is problem in status code ${response.statusCode}');
    }
  }
}

// class GetCategoryService {
//   Future<List<ProductModel>> getCategoryProducts(
//       {required String categoryName}) async {
//     http.Response response = await http.get(
//         Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
//     if(response.statusCode == 200){
//       List<dynamic> data = jsonDecode(response.body);
//       List<ProductModel> categoriesList = [];
//       for (int i = 0; i < data.length; i++) {
//         categoriesList.add(ProductModel.fromJson(data[i]));
//       }
//       return categoriesList;
//     }else {
//       throw Exception('There is problem in status code ${response.statusCode}');
//     }
//   }
// }
