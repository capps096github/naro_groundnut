import '../../naro_exporter.dart';

class NaroLogo extends StatelessWidget {
  const NaroLogo({
    super.key,
    this.logoSize = splashLogoSize,
    this.isGreen = true,
    this.color,
  });

  // width and height
  final double logoSize;

  // is green
  final bool isGreen;

  // color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius4,
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        naroLogo,
        semanticLabel: 'Naro Logo',
        // color: color ?? (isGreen ? naroColor : naroWhite),
        // colorBlendMode: BlendMode.srcIn,
        width: logoSize,
        height: logoSize,
      ),
    );
  }
}

class PaddedLogo extends StatelessWidget {
  const PaddedLogo({
    super.key,
    this.logoSize = authLogoSize,
    this.padding = padding16,
    this.isGreen = true,
  });

  // icon size
  final double logoSize;

  // is green
  final bool isGreen;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: NaroLogo(
          logoSize: logoSize,
          isGreen: isGreen,
        ),
      ),
    );
  }
}
