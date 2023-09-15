
import '../../../naro_exporter.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Good Morning",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: naroWhite,
            fontSize: fontSize16,
          ),
        ),
        Text(
          "Cephas Brian",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: naroWhite,
            fontSize: fontSize24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
