import '../../../data/model/auth_credentials.dart';
import '../../../naro_exporter.dart';

///Email
final emailProvider = StateProvider<String>((ref) => '');

// forgot password email
final forgotEmailProvider = StateProvider<String>((ref) => '');

// username
final userNameProvider = StateProvider<String>((ref) => '');

// password
final passwordProvider = StateProvider<String>((ref) => '');

// confirm password
final confirmPasswordProvider = StateProvider<String>((ref) => '');

// is password confirmed
final isPasswordConfirmedProvider = StateProvider<bool>((ref) {
  // password text
  final password = ref.watch(passwordProvider);

  // confirm password text
  final confirmPassword = ref.watch(confirmPasswordProvider);

  // return true if password and confirm password are equal
  return (password == confirmPassword);
});

// gender
final genderProvider = StateProvider<String>((ref) => selectGender);

// district
final districtProvider = StateProvider<String>((ref) => "");

// village
final villageProvider = StateProvider<String>((ref) => "");

// subcounty
final subcountyProvider = StateProvider<String>((ref) => "");

// phone number
final phoneNumberProvider = StateProvider<String>((ref) => "");

// * Auth Credentials -----

// * Sign Up Credentials
final signUpCredentialsProvider = Provider<SignUpCredentials>((ref) {
  // Credentials
  final email = ref.watch(emailProvider);
  final name = ref.watch(userNameProvider);
  final password = ref.watch(passwordProvider);
  // gender
  final gender = ref.watch(genderProvider);
  // phone number
  final phoneNumber = ref.watch(phoneNumberProvider);
  // district
  final district = ref.watch(districtProvider);
  // subcounty
  final subcounty = ref.watch(subcountyProvider);
  // village
  final village = ref.watch(villageProvider);

  return SignUpCredentials(
    email: email,
    name: name,
    password: password,
    gender: gender,
    phoneNumber: phoneNumber,
    district: district,
    subcounty: subcounty,
    village: village,
  );
});


// * Login Credentials
final loginCredentialsProvider = Provider<LoginCredentials>((ref) {
  // Credentials
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);

  return LoginCredentials(
    email: email,
    password: password,
  );
});
