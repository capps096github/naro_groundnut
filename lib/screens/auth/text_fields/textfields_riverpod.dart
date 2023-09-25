import '../../../naro_exporter.dart';

///Email
final emailProvider = StateProvider<String>((ref) => '');

// forgot password email
final forgotEmailProvider = StateProvider<String>((ref) => '');

// first name
final firstNameProvider = StateProvider<String>((ref) => '');
// last name
final lastNameProvider = StateProvider<String>((ref) => '');

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

// region
final regionProvider = StateProvider<String>((ref) => selectGender);

// district
final districtProvider = StateProvider<String>((ref) => "");

// village
final villageProvider = StateProvider<String>((ref) => "");

// county
final countyProvider = StateProvider<String>((ref) => "");

// subCounty
final subCountyProvider = StateProvider<String>((ref) => "");

// phone number
final phoneNumberProvider = StateProvider<String>((ref) => "");
// nationalId
final nationalIdProvider = StateProvider<String>((ref) => "");

final dateOfBirthProvider = StateProvider<DateTime>((_) => DateTime.now());

// gender
final genderProvider = StateProvider<String>((ref) => selectGender);

// * Auth Credentials -----

// * Sign Up Credentials
final signUpCredentialsProvider = Provider<SignUpCredentials>((ref) {
  // Credentials
  final email = ref.watch(emailProvider);
  final firstName = ref.watch(firstNameProvider);
  final lastName = ref.watch(lastNameProvider);
  final username = ref.watch(userNameProvider);
  final password = ref.watch(passwordProvider);
  // gender
  final gender = ref.watch(genderProvider);
  // phone number
  final phoneNumber = ref.watch(phoneNumberProvider);
  // district
  final district = ref.watch(districtProvider);
  // subCounty
  final subCounty = ref.watch(subCountyProvider);
  // village
  final village = ref.watch(villageProvider);
  // dateOfBirth
  final dateOfBirth = ref.watch(dateOfBirthProvider);
  // dateOfBirth
  final nationalId = ref.watch(nationalIdProvider);
  // region
  final region = ref.watch(regionProvider);
  // county
  final county = ref.watch(countyProvider);

  return SignUpCredentials(
    firstName: firstName,
    lastName: lastName,
    username: username,
    gender: gender,
    dateOfBirth: dateOfBirth,
    nationalId: nationalId,
    email: email,
    phoneNumber: phoneNumber,
    region: region,
    district: district,
    county: county,
    subCounty: subCounty,
    village: village,
    password: password,
  );
});

// * Login Credentials
final loginCredentialsProvider = Provider<LoginCredentials>((ref) {
  // Credentials
  final username = ref.watch(userNameProvider);
  final password = ref.watch(passwordProvider);

  return LoginCredentials(
    username: username,
    password: password,
  );
});
