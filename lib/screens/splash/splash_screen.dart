import '../../naro_exporter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: naroWhite,
      body: NaroLoader(iconColor: naroColor),
    );
  }
}
