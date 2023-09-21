import '../../naro_exporter.dart';

/// This gets the current app user and is called on app start
final naroUserProvider = StateProvider<NaroUser?>((ref) => null);


// is profile complete
final isProfileCompleteProvider = StateProvider<bool>((ref) {
  // this calls the profile api, and if there's no record containing the user id then it returns false
  return false;
});