//* User object that interacts with the post man Api
class NaroUser {
  // profile pic
  final String avatar;

  // username
  final String name;

  // email
  final String email;

  // password
  final String password;

  // country
  // final String country;

  // languageCode e.g EN, fr
  // final String languageCode;

  // user id
  final int id;

  // auth token
  final String token;

  // created at
  final String createdAt;

  // updated at
  final String updatedAt;

  // remember token
  final String rememberToken;

  //   "cooperative_id": null,
  final int cooperativeId;

  // "value_chains": null,
  final String valueChains;
  //

  NaroUser({
    this.name = '',
    required this.email,
    this.password = '',
    this.id = 0,
    this.avatar = '',
    this.token = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.rememberToken = '',
    this.cooperativeId = 0,
    this.valueChains = '',
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

  // country code
  String get countryCode => 'ML';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'avatar': avatar});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'id': id});
    result.addAll({'token': token});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});
    result.addAll({'remember_token': rememberToken});
    result.addAll({'cooperative_id': cooperativeId});
    result.addAll({'value_chains': valueChains});

    return result;
  }

  factory NaroUser.fromMap(Map<String, dynamic> map) {
    return NaroUser(
      id: map['id']?.toInt() ?? 0,
      avatar: map['avatar'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      rememberToken: map['remember_token'] ?? '',
      cooperativeId: map['cooperative_id']?.toInt() ?? 0,
      valueChains: map['value_chains'] ?? '',
    );
  }

  @override
  String toString() {
    return 'NaroUser(avatar: $avatar, name: $name, email: $email, password: $password, id: $id, token: $token, createdAt: $createdAt, updatedAt: $updatedAt, rememberToken: $rememberToken, cooperativeId: $cooperativeId, valueChains: $valueChains)';
  }
}

// get default user from the above response
final defaultUser = NaroUser(
  id: 10000,
  avatar: "defaultProfilePic",
  name: "DemoUser",
  createdAt: "2023-07-12T12:43:58.000000Z",
  updatedAt: "2023-07-12T12:43:58.000000Z",
  email: "demouser@naro.app",
  password: "",
  token:
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NhaGVsLjh0ZWNobm9sb2dpZXMuY2xvdWQvYXBpL2xvZ2luIiwiaWF0IjoxNjg5MTY2MDg5LCJleHAiOjE3MjAyNzAwODksIm5iZiI6MTY4OTE2NjA4OSwianRpIjoiMjlFczNyRXpqa0xhMDE4TCIsInN1YiI6IjY0IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WxLxftLZDDlnLg98GxHThvLNhREKS2ONMeoNPVAHkFw",
);
