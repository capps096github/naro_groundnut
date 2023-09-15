import '../../../naro_exporter.dart';
import 'activities_controller.dart';
import 'greeting.dart';
import 'incomplete_activities.dart';
import 'navbar_icon.dart';
import 'items_data.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: naroColor,
      padding: horizontalPadding8,
      child: Column(
        children: [
          const VerticalSpace(of: spacing8),
          const Greeting(),
          const VerticalSpace(of: spacing16),
          SizedBox(
            height: 100,
            child: ExpandedScrollingRow(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                navItems.length,
                (index) {
                  // screen using elementAt
                  final screen = navItems.elementAt(index);
                  return NavbarIcon(navItem: screen);
                },
              ),
            ),
          ),
          const VerticalSpace(of: spacing16),
          const ActivitiesController(),
          const VerticalSpace(of: spacing8),
          // incomplete
          const IncompleteActivities(),
          const VerticalSpace(of: spacing8),
        ],
      ),
    );
  }
}
