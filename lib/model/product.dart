class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'] is double ? json['price'] : (json['price'] as int).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description, 
      'category': category, 
      'image': image, 
    };
  }
}
