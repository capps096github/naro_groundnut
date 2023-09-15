//* User object that interacts with the post man Api
import '../../global/constants/strings.dart';

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

  // subCounty
  final String subcounty;

  // phone number
  final String phoneNumber;

  // user id
  final int id;

  // auth token
  final String token;

  NaroUser({
    required this.avatar,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.district,
    required this.village,
    required this.subcounty,
    required this.phoneNumber,
    this.id = 0,
    required this.token,
  });

  /// first name
  String get firstName {
    // check if name has a space
    if (!name.contains(' ')) {
      return name;
    }
    return name.split(' ')[0];
  }

  /// last name
  String get lastName {
    if (!name.contains(' ')) {
      return name;
    }
    return name.split(' ')[1];
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'avatar': avatar});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'gender': gender});
    result.addAll({'district': district});
    result.addAll({'village': village});
    result.addAll({'subCounty': subcounty});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'token': token});

    return result;
  }

  factory NaroUser.fromMap(Map<String, dynamic> map) {
    return NaroUser(
      avatar: map['avatar'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      gender: map['gender'] ?? '',
      district: map['district'] ?? '',
      village: map['village'] ?? '',
      subcounty: map['subCounty'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      id: map['id']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  @override
  String toString() {
    return 'NaroUser(avatar: $avatar, name: $name, email: $email, password: $password, gender: $gender, district: $district, village: $village, subcounty: $subcounty, phoneNumber: $phoneNumber, id: $id, token: $token)';
  }
}

// get default user from the above response
final defaultUser = NaroUser(
  id: 10000,
  avatar: defaultProfilePic,
  gender: "N?A",
  district: "Kampla",
  subcounty: "Moro",
  village: "Kamwokya",
  phoneNumber: "0700000000",
  name: "DemoUser",
  email: "demouser@naro.app",
  password: "",
  token:
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NhaGVsLjh0ZWNobm9sb2dpZXMuY2xvdWQvYXBpL2xvZ2luIiwiaWF0IjoxNjg5MTY2MDg5LCJleHAiOjE3MjAyNzAwODksIm5iZiI6MTY4OTE2NjA4OSwianRpIjoiMjlFczNyRXpqa0xhMDE4TCIsInN1YiI6IjY0IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WxLxftLZDDlnLg98GxHThvLNhREKS2ONMeoNPVAHkFw",
);
