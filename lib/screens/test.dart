import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/get_all_products_service.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);
  static String id = 'TestScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.red,
                size: 44, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          GetAllProductsService().getAllProducts();
        },
        child: Text('test api'),
      )),
    );
  }
}
