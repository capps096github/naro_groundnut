
import '../../global/exporter.dart';

class NaroUser {
  // profile pic
  final String avatar;

  // username
  final String name;

  // email
  final String email;

  // password
  final String password;

  // gender
  final String gender;

  // district
  final String district;

  // village
  final String village;

  // phone number
  final String phoneNumber;

  // user id
  final int id;

  // auth token
  final String token;

  final String username;
  final String dateOfBirth;
  final String nationalId;
  final String region;
  final String county;

  final String firstName;
  final String lastName;
  final String subCounty;

  NaroUser({
    required this.firstName,
    required this.lastName,
    required this.subCounty,
    required this.avatar,
    required this.name,
    required this.username,
    required this.dateOfBirth,
    required this.nationalId,
    required this.region,
    required this.county,
    required this.email,
    required this.password,
    required this.gender,
    required this.district,
    required this.village,
    required this.phoneNumber,
    this.id = 0,
    required this.token,
  });

  // user id
  String get userId => id.toString();

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'avatar'.inSnakeCase: avatar});
    result.addAll({'name'.inSnakeCase: name});
    result.addAll({'email'.inSnakeCase: email});
    result.addAll({'password'.inSnakeCase: password});
    result.addAll({'gender'.inSnakeCase: gender});
    result.addAll({'district'.inSnakeCase: district});
    result.addAll({'village'.inSnakeCase: village});
    result.addAll({'phoneNumber'.inSnakeCase: phoneNumber});
    result.addAll({'id'.inSnakeCase: id});
    result.addAll({'token'.inSnakeCase: token});
    result.addAll({'username'.inSnakeCase: username});
    result.addAll({'dateOfBirth'.inSnakeCase: dateOfBirth});
    result.addAll({'nationalId'.inSnakeCase: nationalId});
    result.addAll({'region'.inSnakeCase: region});
    result.addAll({'county'.inSnakeCase: county});
    result.addAll({'firstName'.inSnakeCase: firstName});
    result.addAll({'lastName'.inSnakeCase: lastName});
    result.addAll({'subCounty'.inSnakeCase: subCounty});

    return result;
  }

  // SQL MAP
  Map<String, dynamic> toSQLMap() {
    final result = <String, dynamic>{};

    result.addAll({'avatar': avatar});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'gender': gender});
    result.addAll({'district': district});
    result.addAll({'village': village});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'id': id});
    result.addAll({'token': token});
    result.addAll({'username': username});
    result.addAll({'dateOfBirth': dateOfBirth});
    result.addAll({'nationalId': nationalId});
    result.addAll({'region': region});
    result.addAll({'county': county});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'subCounty': subCounty});

    return result;
  }

  factory NaroUser.fromMap(Map<String, dynamic> map) {
    return NaroUser(
      avatar: map['avatar'.inSnakeCase] ?? '',
      name: map['name'.inSnakeCase] ?? '',
      email: map['email'.inSnakeCase] ?? '',
      password: map['password'.inSnakeCase] ?? '',
      gender: map['gender'.inSnakeCase] ?? '',
      district: map['district'.inSnakeCase] ?? '',
      village: map['village'.inSnakeCase] ?? '',
      phoneNumber: map['phoneNumber'.inSnakeCase] ?? '',
      id: map['id'.inSnakeCase]?.toInt() ?? 0,
      token: map['token'.inSnakeCase] ?? "",
      username: map['username'.inSnakeCase] ?? '',
      dateOfBirth: map['dateOfBirth'.inSnakeCase] ?? '',
      nationalId: map['nationalId'.inSnakeCase] ?? '',
      region: map['region'.inSnakeCase] ?? '',
      county: map['county'.inSnakeCase] ?? '',
      firstName: map['firstName'.inSnakeCase] ?? '',
      lastName: map['lastName'.inSnakeCase] ?? '',
      subCounty: map['subCounty'.inSnakeCase] ?? '',
    );
  }

  // from SQL Map
  factory NaroUser.fromSQLMap(Map<String, dynamic> map) {
    return NaroUser(
      avatar: map['avatar'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      gender: map['gender'] ?? '',
      district: map['district'] ?? '',
      village: map['village'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      id: map['id']?.toInt() ?? 0,
      token: map['token'] ?? "",
      username: map['username'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      nationalId: map['nationalId'] ?? '',
      region: map['region'] ?? '',
      county: map['county'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      subCounty: map['subCounty'] ?? '',
    );
  }

  @override
  String toString() {
    return 'NaroUser(avatar: $avatar, name: $name, email: $email, password: $password, gender: $gender, district: $district, village: $village, phoneNumber: $phoneNumber, id: $id, token: $token, username: $username, dateOfBirth: $dateOfBirth, nationalId: $nationalId, region: $region, county: $county, firstName: $firstName, lastName: $lastName, subCounty: $subCounty)';
  }
}

// get default user from the above response
final defaultUser = NaroUser(
  firstName: "Demo",
  lastName: "User",
  subCounty: "Moro",
  id: 10000,
  avatar: defaultProfilePic,
  gender: "N?A",
  username: '',
  dateOfBirth: "DateTime.now()",
  nationalId: '',
  region: '',
  county: '',
  district: "Kampla",
  village: "Kamwokya",
  phoneNumber: "0700000000",
  name: "DemoUser",
  email: "demouser@naro.app",
  password: "",
  token:
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NhaGVsLjh0ZWNobm9sb2dpZXMuY2xvdWQvYXBpL2xvZ2luIiwiaWF0IjoxNjg5MTY2MDg5LCJleHAiOjE3MjAyNzAwODksIm5iZiI6MTY4OTE2NjA4OSwianRpIjoiMjlFczNyRXpqa0xhMDE4TCIsInN1YiI6IjY0IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WxLxftLZDDlnLg98GxHThvLNhREKS2ONMeoNPVAHkFw",
);
