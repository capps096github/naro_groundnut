import '../../naro_exporter.dart';
import '../complete/complete_profile.dart';
import 'appbar/appbar.dart';
import 'components/activity_list.dart';
import 'navbar/home_navbar.dart';

class NaroHome extends ConsumerWidget {
  const NaroHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final completeProfile = ref.watch(completeProfileProvider);

    //
    return Scaffold(
      backgroundColor: naroColor,
      appBar: homeAppbar(ref),
      body: completeProfile.when(
        data: (isComplete) => isComplete ? const HomeBody() : const CompleteProfile(),
        error: (error, stackTrace) {
          return Text(
          "${error.toString()} - $stackTrace",
          style: const TextStyle(color: naroWhite),
        );
        },
        loading: () => const Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(naroSecondaryColor),
            ),
          ),
        ),
      ),
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
