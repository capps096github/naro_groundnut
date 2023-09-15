import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';
import '../navbar/home_navbar.dart';
import 'appbar_title.dart';
import 'profile_pic.dart';

AppBar homeAppbar(WidgetRef ref) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        // home rail controller
        // final homeRailController = ref.watch(homeRailControllerProvider);

        // open drawer
        // homeRailController.open!();
      },
      icon: const Icon(
        CupertinoIcons.line_horizontal_3_decrease,
        color: naroWhite,
      ),
    ),
    title: const AppBarTitle(),
    actions: const [
      UserProfilePic(),
    ],
  );
}
