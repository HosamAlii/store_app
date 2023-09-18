import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

import '../services/get_all_products_service.dart';
import '../widgets/custom_product_card.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),


        appBar: AppBar(

          iconTheme: IconThemeData(color: Colors.red,size: 30),

          // toolbarHeight:60,
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.grey.shade700,
          //     )),
          elevation: 0,
          title:
              Text('New Trend', style: TextStyle(color: Colors.grey.shade700)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_basket_outlined,
                  color: Colors.black87),
            )
          ],
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                // clipBehavior: Clip.none,
                padding:
                    EdgeInsets.only(top: 100, left: 12, right: 12, bottom: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 100,
                  crossAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  return CustomProductCard(
                    productModel: products[index],
                  );

                },
                itemCount: products.length,
              );
            } else {
              print('hellllo');
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
