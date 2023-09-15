class CropVariety {
  final int id;
  final int cropId;
  final String cropVarietyName;
  final String cropVarietyCode;
  final String cropVarietyGeneration;
  final String createdAt;
  final String updatedAt;
  final String nameText;
  final Crop? crop;

  CropVariety({
     this.id = 0,
    required this.cropId,
    required this.cropVarietyName,
    required this.cropVarietyCode,
    required this.cropVarietyGeneration,
    required this.createdAt,
    required this.updatedAt,
    required this.nameText,
    this.crop,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'crop_id': cropId});
    result.addAll({'crop_variety_name': cropVarietyName});
    result.addAll({'crop_variety_code': cropVarietyCode});
    result.addAll({'crop_variety_generation': cropVarietyGeneration});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});
    result.addAll({'name_text': nameText});
    // result.addAll({'crop': crop.toJson()});

    return result;
  }

  // as json getter
  Map<String, dynamic> get json => toJson();

  factory CropVariety.fromJson(Map<String, dynamic> map) {
    return CropVariety(
      id: map['id']?.toInt() ?? 0,
      cropId: map['crop_id']?.toInt() ?? 0,
      cropVarietyName: map['crop_variety_name'] ?? '',
      cropVarietyCode: map['crop_variety_code'] ?? '',
      cropVarietyGeneration: map['crop_variety_generation'] ?? '',
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      nameText: map['name_text'] ?? '',
      // crop: Crop.fromJson(map['crop']),
    );
  }
}

class Crop {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String cropName;
  final String cropCode;
  final int numberOfDaysBeforeSubmission;
  final int seedViabilityPeriod;
  final int numberOfInspections;

  Crop({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.cropName,
    required this.cropCode,
    required this.numberOfDaysBeforeSubmission,
    required this.seedViabilityPeriod,
    required this.numberOfInspections,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'created_at': createdAt.millisecondsSinceEpoch});
    result.addAll({'updated_at': updatedAt.millisecondsSinceEpoch});
    result.addAll({'crop_name': cropName});
    result.addAll({'crop_code': cropCode});
    result.addAll({'number_of_days_before_submission': numberOfDaysBeforeSubmission});
    result.addAll({'seed_viability_period': seedViabilityPeriod});
    result.addAll({'number_of_inspections': numberOfInspections});

    return result;
  }

  factory Crop.fromJson(Map<String, dynamic> map) {
    return Crop(
      id: map['id']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      cropName: map['crop_name'] ?? '',
      cropCode: map['crop_code'] ?? '',
      numberOfDaysBeforeSubmission: map['number_of_days_before_submission']?.toInt() ?? 0,
      seedViabilityPeriod: map['seed_viability_period']?.toInt() ?? 0,
      numberOfInspections: map['number_of_inspections']?.toInt() ?? 0,
    );
  }
}
