class ProductList {
  ProductList({
    required this.category,
    required this.data,
    required this.nextPaging,
  });

  String category;
  List<Product> data;
  int? nextPaging;
}

class Product {
  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.mainImage,
    required this.images,
    required this.variants,
    required this.colors,
    required this.sizes,
  });

  int id;
  String category;
  String title;
  String description;
  int price;
  String texture;
  String wash;
  String place;
  String note;
  String story;
  String mainImage;
  List<String> images;
  List<Variant> variants;
  List<MyColor> colors;
  List<String> sizes;

  static Product getDefaultProduct() {
    return Product(
        id: -1,
        category: "",
        title: "",
        description: "",
        price: 0,
        texture: "",
        wash: "",
        place: "",
        note: "",
        story: "",
        mainImage: "",
        images: [],
        variants: [],
        colors: [],
        sizes: []);
  }

}

class MyColor {
  MyColor({
    required this.code,
    required this.name,
  });

  String code;
  String name;
}

class Variant {
  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  String colorCode;
  String size;
  int stock;
}
