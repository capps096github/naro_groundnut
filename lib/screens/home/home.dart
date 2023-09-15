import '../../naro_exporter.dart';
import 'appbar/appbar.dart';
import 'components/activity_list.dart';
import 'navbar/home_navbar.dart';

class NaroHome extends ConsumerWidget {
  const NaroHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: naroColor,
      appBar: homeAppbar(ref),
      body: const Column(
        children: [
          HomeNavbar(),
          // activities
          Expanded(child: ActivityList()),
          //
        ],
      ),
    );
  }
}
