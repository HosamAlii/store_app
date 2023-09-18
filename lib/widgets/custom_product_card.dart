import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../screens/update_product_screen.dart';

class CustomProductCard extends StatelessWidget {
   CustomProductCard({
    required this.productModel,
     Key? key,
   }) : super(key: key);
ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments:productModel );

      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(5, 5), blurRadius: 10 , color: Colors.grey.withOpacity(.3))
        ]),

        child: Stack(clipBehavior: Clip.none, children: [
           Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  children: [
                    Text(productModel.title.substring(0,7), style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r'$' '${productModel.price}',style: TextStyle(fontWeight: FontWeight.w500)),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                )
              ]),
            ),
          ),
          Positioned(
              top: -60,
              right: 20,
              child: Image.network(
                productModel.image,
                width: 100,
                  height: 100,
                //  'https://www.meisterdrucke.ae/kunstwerke/400w/Julia%20McLemore%20-%20Begonia%20White%20(digital%20photogram%20digital%20original%20print)%20-%20(MeisterDrucke-153565).jpg'
                  )),
        ]),
      ),
    );
  }
}
