import '../../naro_exporter.dart';

class NaroLoader extends StatelessWidget {
  const NaroLoader({
    super.key,
    this.iconColor = naroColor,
  });

  // icon color
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: Column(
        children: [
          const Spacer(),
          Center(child: NaroLogo(color: iconColor)),

          const Spacer(),
          Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                  strokeWidth: 4, valueColor: AlwaysStoppedAnimation<Color>(iconColor)),
            ),
          ),
          const VerticalSpace(of: spacing40) // ,Center
        ],
      ),
    );
  }
}
