class Product {
  int id;
  String title;
  String image;
  Product({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String);
  }

  Product copyWith({
    int? id,
    String? title,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }
}
