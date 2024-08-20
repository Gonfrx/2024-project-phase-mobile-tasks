import 'dart:convert';

import 'package:clean_arc_practice/features/ecommerce/data/models/product_model.dart';
import 'package:clean_arc_practice/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/read_json.dart';

void main() {
  final productModel = ProductModel(
      id: "6672776eb905525c145fe0bb",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123.0,
      imageURL:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg");
  test('should be a subclass of Product entity', () async {
    expect(productModel, isA<Product>());
  });

  test('should return a product model', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('json_dummy.json'),
    );
    //act
    final result = ProductModel.fromJson(jsonMap);

    //assert
    expect(result, productModel);
  });

  test('should return a json map containing proper data', () async {
    final result = productModel.toJson();

    //assert
    final expectedJsonMap = {
      "id": "6672776eb905525c145fe0bb",
      "name": "Anime website",
      "description": "Explore anime characters.",
      "price": 123.0,
      "imageURL":
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg"
    };
    expect(result, expectedJsonMap);
  });
}
