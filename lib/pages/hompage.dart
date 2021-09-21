import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:flutter_cataloge/widgets/drawer.dart';
import 'package:flutter_cataloge/widgets/item_widget.dart';

import '../theme.dart';
import 'catalog_list.dart';
import 'hom_widgets/catalogheader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = 'Codepur';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogjson =
        await rootBundle.loadString("assets/files/catalogjson.json");
    print(catalogjson);
    final decodeData = jsonDecode(catalogjson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    print(productsData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List<Item>.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        // Header;
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )

                // "Catalog App".text.xl5.bold.color(MyTheme.darkbulishColor).make(),
                // "Trending products".text.xl2.make(),
              ],
            ),
          ),
        )

        //
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //       ? GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 16),
        //           itemBuilder: (context, indext) {
        //             final item = CatalogModel.items[indext];
        //             return Card(
        //                 clipBehavior: Clip.antiAlias,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(10)),
        //                 child: GridTile(
        //                   header: Container(
        //                     child: Text(
        //                       item.name,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.deepPurple,
        //                     ),
        //                   ),
        //                   child: Image.asset(
        //                     item.image,
        //                     // height: 50,
        //                     // fit: BoxFit.contain,
        //                   ),
        //                   footer: Container(
        //                     child: Text(
        //                       item.price.toString(),
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.black,
        //                     ),
        //                   ),
        //                 ));
        //           },
        //           itemCount: CatalogModel.items.length,
        //         )

        //       // ListView.builder(
        //       //     itemCount: CatalogModel.items.length,
        //       //     itemBuilder: (context, indext) => ItemWidget(
        //       //       item: CatalogModel.items[indext],
        //       //     ),
        //       //   )

        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),

        // // Center(
        // //   child: Container(
        // //     child: Text('Welcome to $days days of flutter $name'),
        // //   ),
        // // ),
        // drawer: MyDrawer(), //footer;
        );
  }
}
