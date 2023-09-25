import '../../../naro_exporter.dart';
import '../about_item.dart';
import 'about_tile.dart';

class LogoutTile extends ConsumerWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.watch(userServiceProvider);

    return AboutTile(
      textColor: naroWhite,
      tileColor: naroRed,
      aboutItem: AboutItem(
        icon: Icons.logout,
        label: 'Logout',
        onTap: () async => await userService.logout().then((_) => popAllAndPushNamed(authPath)),
        tooltip: 'Logout of your account',
      ),
    );
  }
}
