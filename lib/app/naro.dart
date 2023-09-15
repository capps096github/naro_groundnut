import 'package:get/get.dart';

import '../naro_exporter.dart';

class Naro extends ConsumerWidget {
  ///This is the root of our naro app
  const Naro({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getPages = ref.watch(getPagesProvider);
    // final initialRoute = ref.watch(initialRouteProvider);

    final naroTheme = ref.watch(naroThemeProvider);

    return GetMaterialApp(
      // -- Initializer Called on App Start --
      onInit: () async {
        if (!isNaroWindows) {
          final userService = ref.watch(userServiceProvider);
          printer("Initalizing router...");

          // * User Service and other Loading Services here
          final appUser = await userService.getCurrentUser();

          printer("User got storage: $appUser");

          // update the current app user
          ref.read(naroUserProvider.notifier).state = appUser;
        }
        //* go to the corresponding page
        // delay for 1 second
        await Future.delayed(
          oneSecond,
          // () => pushNamed((appUser == null) ? authPath : lauchPath),
          () => pushNamed(lauchPath),
        );

        printer("App Now Starts...");
      },

      // start with splash screen
      initialRoute: splashPath,

      // pages
      getPages: getPages,

      // error page
      unknownRoute: GetPage(name: notFoundPath, page: () => const NaroErrorScreen()),

      // -- Theme --
      color: naroColor,
      theme: naroTheme,

      // -- Title --
      title: naroTitle,

      // -- Debug Mode --
      debugShowCheckedModeBanner: false,

      // -- Bouncing Scroll Behavior --
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
    );
  }
}
