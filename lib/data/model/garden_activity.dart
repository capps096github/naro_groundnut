import 'package:faker/faker.dart';


class GardenActivity {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String gardenId;
  final String gardenText;
  final String userId;
  final String userText;
  final String cropActivityId;
  final String cropActivityText;
  final String activityName;
  final String activityDescription;
  final String activityDateToBeDone;
  final String activityDueDate;
  final String activityDateDone;
  final String farmerHasSubmitted;
  final String farmerActivityStatus;
  final String farmerSubmissionDate;
  final String farmerComment;
  final String agentId;
  final String agentText;
  final String agentNames;
  final String agentHasSubmitted;
  final String agentActivityStatus;
  final String agentComment;
  final String agentSubmissionDate;
  final String photo;
  final String tempStatus;

  // DateTime activityDateToBeDoneDate = DateTime.now();

  GardenActivity({
     this.id = 0,
    required this.createdAt,
    required this.updatedAt,
    required this.gardenId,
    required this.gardenText,
    required this.userId,
    required this.userText,
    required this.cropActivityId,
    required this.cropActivityText,
    required this.activityName,
    required this.activityDescription,
    required this.activityDateToBeDone,
    required this.activityDueDate,
    required this.activityDateDone,
    required this.farmerHasSubmitted,
    required this.farmerActivityStatus,
    required this.farmerSubmissionDate,
    required this.farmerComment,
    required this.agentId,
    required this.agentText,
    required this.tempStatus,
    required this.agentNames,
    required this.agentHasSubmitted,
    required this.agentActivityStatus,
    required this.agentComment,
    required this.agentSubmissionDate,
    required this.photo,
  });

  // random garden generator using faker
  factory GardenActivity.random() {
    final faker = Faker();
    return GardenActivity(
      id: faker.randomGenerator.integer(9999),
      createdAt: faker.date.dateTime().toString(),
      updatedAt: faker.date.dateTime().toString(),
      gardenId: faker.lorem.word(),
      gardenText: faker.lorem.word(),
      userId: faker.lorem.word(),
      userText: faker.lorem.word(),
      cropActivityId: faker.lorem.word(),
      cropActivityText: faker.lorem.word(),
      activityName: faker.lorem.word(),
      activityDescription: faker.lorem.word(),
      activityDateToBeDone: faker.date.dateTime().toString(),
      activityDueDate: faker.date.dateTime().toString(),
      activityDateDone: faker.date.dateTime().toString(),
      farmerHasSubmitted: faker.lorem.word(),
      farmerActivityStatus: faker.lorem.word(),
      farmerSubmissionDate: faker.date.dateTime().toString(),
      farmerComment: faker.lorem.word(),
      agentId: faker.lorem.word(),
      agentText: faker.lorem.word(),
      agentNames: faker.lorem.word(),
      agentHasSubmitted: faker.lorem.word(),
      agentActivityStatus: faker.lorem.word(),
      agentComment: faker.lorem.word(),
      agentSubmissionDate: faker.date.dateTime().toString(),
      photo: faker.lorem.word(),
      tempStatus: faker.lorem.word(),
    );
  }
}
