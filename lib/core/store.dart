
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../models/cart.dart';

class MyStore extends VxStore {

  // CatalogModel catalog;
  // CartModel cart;

  // MyStore() {
  //   catalog = CatalogModel();
  //   cart = CartModel();
  //   cart.catalog = catalog;
  // }

  final catalog = CatalogModel();

  final cart = CartModel();

  MyStore() {
    cart.catalog = catalog;
  }

}