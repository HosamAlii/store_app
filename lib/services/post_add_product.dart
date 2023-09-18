

import '../api_services/api.dart';
import '../models/product_model.dart';

class PostProductService {
 //
 // Future<ProductModel> addProduct(
 //      {required String title,
 //      required double price,
 //      required String description,
 //      required String image,
 //      required String category}) async {
 //    http.Response response =
 //        await http.post(Uri.parse('https://fakestoreapi.com/products'), body: {
 //      'title': title,
 //      'price': price,
 //      'description': description,
 //      'image': image,
 //      'category': category
 //    },headers: {
 //          'Content-Type' : 'multipart/form-data',
 //          'Accept':'application/json'
 //        });
 //
 //    if (response.statusCode == 200) {
 //
 //      return ProductModel.fromJson(jsonDecode(response.body));
 //    } else {
 //
 //      throw Exception('Failed to create Product. status code ${response.statusCode}');
 //
 //
 //    }
 //  }

  Future<ProductModel> addProduct({required String title ,required String price, required String description,required String image,required String category})async{
   Map<String, dynamic> data =await Api().post(  url: 'https://fakestoreapi.com/products',body: {
    'title': title,
    'price': price,
    'description': description,
    'image': image,
    'category': category
    },);
   return ProductModel.fromJson(data);

  }










}
