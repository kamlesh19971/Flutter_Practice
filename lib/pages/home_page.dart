import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  static const days = 30;
  static const name = "Kamlesh";
    
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold( 
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length, 
            itemBuilder: (BuildContext context, int index) {  
              return ItemWidget(item: dummyList[index]);
            },
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}