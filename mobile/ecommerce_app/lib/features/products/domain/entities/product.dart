import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final dynamic price;
  final String imageUrl;
  const Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, name, description, price, imageUrl];
  }
}
