import 'package:flutter/material.dart';
import 'package:store_app/screens/update_product_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      child: ListView(

          children:   [
        const UserAccountsDrawerHeader(
          accountEmail: Text('store@gmail.com'),
          accountName: Text('Store App'),
//           currentAccountPicture: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg')),
decoration: BoxDecoration(image: DecorationImage( image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlUNqFgyxJqnRt8Sz5GTdI-r2XMzsbVb2x9A&usqp=CAU'),fit: BoxFit.cover)),
        ),
            ListTile(title: const Text('Add Product'),leading: const Icon(Icons.add_box_outlined,color: Colors.black),onTap: () {

            },),
            Divider(thickness: 2,color: Colors.blue,),
            ListTile(onTap: () {
             Navigator.pushNamed(context, UpdateProductScreen.id);
            },leading: Icon(Icons.update,color: Colors.black),title: Text('Update Product'),),
            Divider(thickness: 2,color: Colors.blue,),

          ]),
    );
  }
}
