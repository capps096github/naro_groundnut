// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
