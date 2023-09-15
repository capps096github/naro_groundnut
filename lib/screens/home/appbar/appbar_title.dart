import '../../../naro_exporter.dart';

class AppBarTitle extends ConsumerWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    return const AnimatedSwitcher(
      duration: quarterSeconds,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // PaddedLogo(padding: padding4, logoSize: appBarLogoSize),
          // HorizontalSpace(of: spacing4),
          Text(
            "NARO",
            style: TextStyle(
              color: naroWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
