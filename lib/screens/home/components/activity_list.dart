import '../../../naro_exporter.dart';
import '../../activities/activity_bottom_sheet.dart';
import 'garden_warning.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: padding4,
      margin: margin8,
      decoration: const BoxDecoration(
        color: naroWhite,
        borderRadius: borderRadius4,
      ),
      child: RefreshIndicator(
        onRefresh: () async {},
        color: naroWhite,
        backgroundColor: naroColor,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const ThickHorizontalDivider(
              dividerWidth: double.infinity,
              thickness: 1,
              margin: verticalMargin8,
            );
          },
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  barrierColor: naroColor.withOpacity(.3),
                  builder: (context) {
                    return ActivityBottomSheet(activity: GardenActivity.random());
                  },
                );
              },
              title: const Text(
                "DATE DUE: Activity Name",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Activity Description"),
                  const VerticalSpace(of: spacing8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "GARDEN: Garden Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: fontSize12,
                          ),
                        ),
                        //
                      ),
                      const HorizontalSpace(of: spacing8),
                      GardenWarning(isActive: index.isOdd),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
