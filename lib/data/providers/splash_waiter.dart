// future provider to wait for 2 seconds
import '../../naro_exporter.dart';

final splashWaiterProvider = FutureProvider<NaroUser?>((ref) async {
//  user service
  final userService = ref.watch(userServiceProvider);

  // update the current app user
  return await userService.getCurrentUser();
});


