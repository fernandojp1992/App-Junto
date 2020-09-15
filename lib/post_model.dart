class Product{
  String email;
  Product({this.email});
  factory Product.fromJson(Map<String, dynamic> parsedJson){
    return Product(
        email: parsedJson['email'],
    );
  }
}