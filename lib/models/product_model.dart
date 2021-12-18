class ProductModel {
  ProductModel({
    required this.describe,
    required this.id,
    required this.price,
    required this.image,
    required this.title,
  });
  late final String describe;
  late final String id;
  late final String price;
  late final String image;
  late final String title;

  ProductModel.fromJson(Map<String, dynamic> json) {
    describe = json['describe'];
    id = json['id'];
    price = json['price'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['describe'] = describe;
    _data['id'] = id;
    _data['price'] = price;
    _data['image'] = image;
    _data['title'] = title;
    return _data;
  }
}
