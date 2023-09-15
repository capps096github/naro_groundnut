import 'package:faker/faker.dart';

class Garden {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String cropName;
  final String status;
  final String productionScale;
  final String plantingDate;
  final String landOccupied;
  final String cropId;
  final String cropText;
  final String details;
  final String userId;
  final String userText;
  final String photo;

  Garden({
     this.id = 0,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.cropName,
    required this.status,
    required this.productionScale,
    required this.plantingDate,
    required this.landOccupied,
    required this.cropId,
    required this.cropText,
    required this.details,
    required this.userId,
    required this.userText,
    required this.photo,
  });


  // random garden generator using faker
  factory Garden.random() {
    final faker = Faker();
    return Garden(
      id: faker.randomGenerator.integer(9999),
      createdAt: faker.date.dateTime().toString(),
      updatedAt: faker.date.dateTime().toString(),
      name: faker.lorem.word(),
      cropName: faker.lorem.word(),
      status: faker.lorem.word(),
      productionScale: faker.lorem.word(),
      plantingDate: faker.date.dateTime().toString(),
      landOccupied: faker.lorem.word(),
      cropId: faker.lorem.word(),
      cropText: faker.lorem.word(),
      details: faker.lorem.word(),
      userId: faker.lorem.word(),
      userText: faker.lorem.word(),
      photo: faker.lorem.word(),
    );
  }
}
