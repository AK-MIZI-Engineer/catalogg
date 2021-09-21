import 'package:flutter/cupertino.dart';
import 'package:flutter_cataloge/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().wh24(context);
  }
}