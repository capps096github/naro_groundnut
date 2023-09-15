import 'package:faker/faker.dart';

class Product {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String administratorId;
  final String administratorText;
  final String name;
  final String type;
  final String photo;
  final String details;
  final String price;
  final String offerType;
  final String state;
  final String category;
  final String subcountyId;
  final String subcountyText;
  final String districtId;
  final String districtText;

  Product({
    this.id = 0,
    required this.createdAt,
    required this.updatedAt,
    required this.administratorId,
    required this.administratorText,
    required this.name,
    required this.type,
    required this.photo,
    required this.details,
    required this.price,
    required this.offerType,
    required this.state,
    required this.category,
    required this.subcountyId,
    required this.subcountyText,
    required this.districtId,
    required this.districtText,
  });


  // random product generator using faker
  factory Product.random() {
    final faker = Faker();
    return Product(
      id: faker.randomGenerator.integer(9999),
      createdAt: faker.date.dateTime().toString(),
      updatedAt: faker.date.dateTime().toString(),
      administratorId: faker.lorem.word(),
      administratorText: faker.lorem.word(),
      name: faker.lorem.word(),
      type: faker.lorem.word(),
      photo: "",
      details: faker.lorem.word(),
      price: "${faker.randomGenerator.integer(9999)}",
      offerType: faker.lorem.word(),
      state: faker.lorem.word(),
      category: faker.lorem.word(),
      subcountyId: faker.lorem.word(),
      subcountyText: faker.lorem.word(),
      districtId: faker.lorem.word(),
      districtText: faker.lorem.word(),
    );
  }
}
