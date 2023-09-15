// Project imports:

import '../../../naro_exporter.dart';
import '../../create/create_bottom_sheet.dart';
import 'nav_item.dart';

class NavbarIcon extends ConsumerWidget {
  const NavbarIcon({
    super.key,
    required this.navItem,
  });

  // screen
  final NavItem navItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const color = naroColor;
    // icon button with svg as icon
    return Padding(
      padding: horizontalPadding4,
      child: InkWell(
        onTap: () {
          // update the selected index
          if (navItem.goToWidget != null) {
            push(navItem.goToWidget!);
          } else {
            // show that nav menu
            showModalBottomSheet(
              context: context,
              
              barrierColor: naroBlack.withOpacity(.8),
              builder: (context) => const CreateBottomSheet(),
            );
          }
        },
        customBorder: const RoundedRectangleBorder(
          borderRadius: borderRadius8,
        ),
        child: Padding(
          padding: padding4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: naroSecondaryColor,
                radius: 30,
                child: Icon(
                  navItem.icon,
                  size: 35,
                  color: color,
                ),
              ),

              const VerticalSpace(of: spacing4),

              // text
              Text(
                navItem.name,
                style: const TextStyle(
                  color: naroWhite,
                  fontSize: fontSize12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
