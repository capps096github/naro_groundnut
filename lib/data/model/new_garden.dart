
import 'package:dio/dio.dart';

class NewGarden {
  // garden photo
  final MultipartFile? gardenPhoto;

  // photo path
  final String? photoPath;

  // garden name
  final String gardenName;

  // planting date
  final DateTime plantingDate;

  // groundnut varierty
  final String groundnutVariety;

  // garden details
  final String gardenDetails;

  // garden id
  final int gardenId;

  // production scale
  final String productionScale;

  // garden size
  final String gardenSize;

  NewGarden({
    this.gardenPhoto,
    this.photoPath,
    required this.gardenName,
    required this.groundnutVariety,
    required this.plantingDate,
    required this.productionScale,
    required this.gardenSize,
    required this.gardenDetails,
     this.gardenId = 0,
  });

  // get the form as json
  Map<String, dynamic> get asJson => toJson();

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (gardenPhoto != null) {
      result.addAll({'gardenPhoto': gardenPhoto});
    }
    result.addAll({'gardenName': gardenName});
    result.addAll({'plantingDate': plantingDate.millisecondsSinceEpoch});
    result.addAll({'groundnutVariety': groundnutVariety});
    result.addAll({'gardenDetails': gardenDetails});
    result.addAll({'gardenId': gardenId});
    result.addAll({'productionScale': productionScale});
    result.addAll({'gardenSize': gardenSize});

    return result;
  }

  factory NewGarden.fromJson(Map<String, dynamic> map) {
    return NewGarden(
      photoPath: map['photoPath'] ?? '',
      gardenName: map['gardenName'] ?? '',
      plantingDate: map['plantingDate'],
      groundnutVariety: map['groundnutVariety'] ?? '',
      gardenDetails: map['gardenDetails'] ?? '',
      gardenId: map['gardenId']?.toInt() ?? 0,
      productionScale: map['productionScale'] ?? '',
      gardenSize: map['gardenSize'] ?? '',
    );
  }
}
