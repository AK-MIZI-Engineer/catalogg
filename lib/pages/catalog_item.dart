import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../theme.dart';
import 'catalog_list.dart';
import 'hom_widgets/catalog_image.dart';
import 'hom_widgets/catalogheader.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                // catalog.desc.text.make(),
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().py16().expand(),

                Text("",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.button),

                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          )),
                      child: "Buy".text.make(),
                    )
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ).box.rounded.color(MyTheme.creamColor).make().p16().w40(context)
        ],
      ),
    ).white.roundedLg.square(100).make().py16();
  }
}
