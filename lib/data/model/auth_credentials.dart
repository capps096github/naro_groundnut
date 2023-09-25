import '../../naro_exporter.dart';

class SignUpCredentials {
  final String username;
  final String firstName, lastName;
  final String gender;
  final DateTime dateOfBirth;
  final String nationalId;
  final String email;
  final String phoneNumber;
  final String region;
  final String district;
  final String county;
  final String subCounty;
  final String village;
  final String avatar;
  final String password;

  SignUpCredentials({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    required this.nationalId,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.district,
    required this.county,
    required this.subCounty,
    required this.village,
    this.avatar = defaultProfilePic,
    required this.password,
  });

  // get the form as json
  Map<String, dynamic> get asMap => toMap();

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName'.inSnakeCase: firstName});
    result.addAll({'lastName'.inSnakeCase: lastName});
    result.addAll({'username'.inSnakeCase: username});
    result.addAll({'gender'.inSnakeCase: gender});
    result.addAll({'dateOfBirth'.inSnakeCase: dateOfBirth.millisecondsSinceEpoch});
    result.addAll({'nationalId'.inSnakeCase: nationalId});
    result.addAll({'email'.inSnakeCase: email});
    result.addAll({'phoneNumber'.inSnakeCase: phoneNumber});
    result.addAll({'region'.inSnakeCase: region});
    result.addAll({'district'.inSnakeCase: district});
    result.addAll({'county'.inSnakeCase: county});
    result.addAll({'subCounty'.inSnakeCase: subCounty});
    result.addAll({'village'.inSnakeCase: village});
    result.addAll({'avatar'.inSnakeCase: avatar});
    result.addAll({'password'.inSnakeCase: password});

    return result;
  }

  @override
  String toString() {
    return 'SignUpCredentials(username: $username, name: $firstName - $lastName , gender: $gender, dateOfBirth: $dateOfBirth, nationalId: $nationalId, email: $email, phoneNumber: $phoneNumber, region: $region, district: $district, county: $county, subCounty: $subCounty, village: $village, avatar: $avatar, password: $password)';
  }
}

// * Login Credentials
class LoginCredentials {
  // email
  final String username;
  // password
  final String password;

  LoginCredentials({
    required this.username,
    required this.password,
  });

  // get the form as json
  Map<String, dynamic> get asMap => toMap();

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'password': password});

    return result;
  }

  @override
  String toString() => 'LoginCredentials(username: $username, password: $password)';
}
