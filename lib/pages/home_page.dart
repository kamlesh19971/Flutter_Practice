import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  static const days = 30;
  static const name = "Kamlesh";
    
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Center(
          child: Container(
            child: const Text("Welcome to $days Days of flutter by $name"),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}