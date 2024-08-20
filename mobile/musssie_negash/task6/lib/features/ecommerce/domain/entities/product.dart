import 'package:equatable/equatable.dart';

class Product extends Equatable {
  String name;
  double price;
  String description;
  String id;
  String imageURL;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.id,
    required this.imageURL,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, id, price, description, imageURL];
}
