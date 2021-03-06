import 'dart:convert';

class CatalogModel {
  static List<Item> items = [
    Item(
      id: 1,
      name: "iPhone 12",
      desc: "Apple iPhone 12 Generation",
      price: 9999,
      image: "assets/images/iiPhone.png",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;

  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       id: map["id"],
//       name: map["name"],
//       desc: map["desc"],
//       price: map["price"],
//       image: map["image"],
//     );
//   }
//   toMap() => {
//         "id": id,
//         "name": name,
//         "desc": desc,
//         "price": price,
//         "image": image,
//       };

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
