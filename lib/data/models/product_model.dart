class GetProductsModel {
  final int status;
  final String message;
  final List<ProductsModel> products;

  GetProductsModel({
    required this.products,
    required this.status,
    required this.message,
  });

  factory GetProductsModel.fromJson(Map<String, dynamic> json) {
    return GetProductsModel(
      products: List<ProductsModel>.from(
          json['products'].map((x) => ProductsModel.fromJson(x))),
      status: json['status'],
      message: json['message'],
    );
  }
}

class ProductsModel {
  final int id;
  final String name;
  final String company;
  final String type;
  final String image;
  final String price;
  final String description;

  ProductsModel({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.description,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      company: json['company'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
    );
  }
}
