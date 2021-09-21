import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:flutter_cataloge/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../theme.dart';
import 'catalog_item.dart';
import 'hom_widgets/catalogheader.dart';
import 'hompage.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, indext) {
          final catalog = CatalogModel.items[indext];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailsPage(
                        catalog: catalog,
                      ),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
        });
  }
}
