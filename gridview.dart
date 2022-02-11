import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';


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
    
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
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
          title: const Text("Catalog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CatalogModel.items.isNotEmpty ? 
          // ListView.builder(
          //   itemCount: CatalogModel.items.length, 
          //   itemBuilder: (BuildContext context, int index) => ItemWidget(item: CatalogModel.items[index]),
          // )
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ), 
            itemBuilder: (context, index) {
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                    child: Text(item.name, style: const TextStyle(color: Colors.white),),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple
                    ),
                  ),
                  child: Image.network(item.image),
                  footer: Container(
                    child: Text(item.price.toString(), style: const TextStyle(color: Colors.white),),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black
                    ),
                  ),
                )
              );
            }, 
            itemCount: CatalogModel.items.length
          )
          : 
          const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        drawer: const MyDrawer(),
      );
  }
}