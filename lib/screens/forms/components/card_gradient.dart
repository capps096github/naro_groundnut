import '../../../naro_exporter.dart';

class CardGradient extends StatelessWidget {
  const CardGradient({
    super.key,
    this.gradientColor = naroColor,
    this.borderRadius = borderRadius8,
  });

  final Color gradientColor;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      width: double.infinity,
      height: maxCardHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            naroTransparent,
            naroTransparent,
            gradientColor.withOpacity(0.25),
            gradientColor.withOpacity(0.5),
            gradientColor.withOpacity(0.8),
            gradientColor,
            gradientColor,
          ],
        ),
      ),
    );
  }
}
