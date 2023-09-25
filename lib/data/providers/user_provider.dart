import '../../naro_exporter.dart';

/// This gets the current app user and is called on app start
final naroUserProvider = StateProvider<NaroUser?>((ref) => null);

/// This gets the current app user and is called on app start
final completeProfileProvider = FutureProvider<bool>((ref) async {
  final formService = ref.watch(formServiceProvider);
  return await formService.isProfileComplete();
});
