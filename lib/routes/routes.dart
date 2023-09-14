import 'package:get/get.dart';

import '../../naro_exporter.dart';

///* this provides the default router delegate for the app
final getPagesProvider = Provider<List<GetPage<Widget>>>((ref) {
  // router delegate
  final List<GetPage<Widget>> getPages = [
    //* home page
    GetPage(
      name: splashPath,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: homePath,
      page: () => const NaroHome(),
    ),

    //* auth
    GetPage(
      name: authPath,
      page: () => const NaroAuth(),
    ),

    //* user

    // * settings
    GetPage(
      name: settingsPath,
      page: () => const NaroSettings(),
    ),
  ];

  return getPages;
});

/// After the app is initialized, this provider will provide the initial path
// final initialRouteProvider = StateProvider<String>((ref) => splashPath);
