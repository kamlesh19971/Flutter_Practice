import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  static const days = 30;
  static const name = "Kamlesh";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData =  json.decode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map((item) => Item.fromMap(item))
        .cast<Item>().toList();
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold( 
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: CatalogModel.items.isNotEmpty ? ListView.builder(
            itemCount: CatalogModel.items.length, 
            itemBuilder: (BuildContext context, int index) => ItemWidget(item: CatalogModel.items[index]),
          ): const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}