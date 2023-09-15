class SignUpCredentials {
  // email
  final String email;
  // name
  final String name;
  // password
  final String password;
  // gender
  final String gender;
  // phoneNumber
  final String phoneNumber;
  // district
  final String district;
  // subcounty
  final String subcounty;
  // village
  final String village;

  SignUpCredentials({
    required this.email,
    required this.name,
    required this.password,
    required this.gender,
    required this.phoneNumber,
    required this.district,
    required this.subcounty,
    required this.village,
  });
}

// * Login Credentials
class LoginCredentials {
  // email
  final String email;
  // password
  final String password;

  LoginCredentials({
    required this.email,
    required this.password,
  });
}
