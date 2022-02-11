
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  late CatalogModel _catalog;

  final List<int> _itemIds = [];  

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }
 
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

}


class AddMutatoin extends VxMutation<MyStore> {
  final Item item;

  AddMutatoin(this.item);
    
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }

}