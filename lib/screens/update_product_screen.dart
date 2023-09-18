import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';

import '../models/product_model.dart';
import '../services/put_update_proguct.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  String? title, desc, image;

  String? price;
  bool isLoading = false;
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(title: Text('Update Product')),
        body: ListView(children: [
          SizedBox(
            height: 100,
          ),
          CustomTextField(
              onChange: (data) {
                title = data;
              },
              labelText: 'Title',
              hintText: 'Write the title'),
          CustomTextField(
              onChange: (data) {
                desc = data;
              },
              labelText: 'Description',
              hintText: 'Write the Description'),
          CustomTextField(
              onChange: (data) {
                price = data;
              },
              labelText: 'Price',
              hintText: 'Write the Price'),
          CustomTextField(
              onChange: (data) {
                image = data;
              },
              labelText: 'Image',
              hintText: 'Write the url'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await updateProduct(product);
                    print('success');
                  } catch (e) {
                    print('Error updating product: $e');
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
                text: 'Update'),
          ),
        ]),
      ),
    );
  }
  //
//   Future<ProductModel> updateProduct(ProductModel product) {
//     return UbdateProductService().updateProduct(
//                     title: title == null ? product.title : title!,
//                     price: price == null ? product.price : price!,
//                     description: desc == null ? product.description : desc!,
//                     image: image == null ? product.image : image!,
//                     category: product.category,
//                     id: product.id.toString()
//     );
//   }
// }

//   Future<void> updateProduct(ProductModel product) async {
//     try {
//       final updatedProduct = await UbdateProductService().updateProduct(
//         title: title ?? product.title,
//         price: price ?? product.price,
//         description: desc ?? product.description,
//         image: image ?? product.image,
//         category: product.category,
//         id: product.id,
//       );
//
//       print('Product updated successfully: $updatedProduct');
//     } catch (e) {
//       print('Error updating product: $e');
//     }
//   }
// }
  Future<void> updateProduct(ProductModel? product) async {
    try {
      if (product != null) {
        final updatedProduct = await UbdateProductService().updateProduct(
          title: title ?? product.title,
          price: price ?? product.price.toString(),
          description: desc ?? product.description,
          image: image ?? product.image,
          category: product.category,
          id: product.id,
        );

        print('Product updated successfully: $updatedProduct');
      } else {
        print('Product object is null.');
      }
    } catch (e) {
      print('Error updating product: $e');
    }
  }
}
