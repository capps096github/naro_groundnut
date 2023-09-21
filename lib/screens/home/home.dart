import '../../naro_exporter.dart';
import '../complete/complete_profile.dart';
import 'appbar/appbar.dart';
import 'components/activity_list.dart';
import 'navbar/home_navbar.dart';

class NaroHome extends ConsumerWidget {
  const NaroHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isProfileComplete = ref.watch(isProfileCompleteProvider);

    //
    return Scaffold(
      backgroundColor: naroColor,
      appBar: homeAppbar(ref),
      body: isProfileComplete ? const HomeBody() : const CompleteProfile(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeNavbar(),
        // activities
        Expanded(child: ActivityList()),
        //
      ],
    );
  }
}
