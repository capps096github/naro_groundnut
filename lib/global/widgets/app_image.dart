import 'package:cached_network_image/cached_network_image.dart';
import '../../../naro_exporter.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = BorderRadius.zero,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.backgroundColor = naroColor,
    this.textColor = naroWhite,
  });

  final String imageUrl;
  final BoxFit fit;

  final BorderRadius borderRadius;

  // width and height are optional
  final double? width, height;

  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: height,
        width: width,
        color: naroColor.withOpacity(.2),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          placeholder: (context, url) => const PaddedLogo(logoSize: 30),
          errorWidget: (context, url, _) => const PaddedLogo(),
        ),
      ),
    );
  }
}
