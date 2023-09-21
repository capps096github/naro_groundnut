import '../../naro_exporter.dart';
import 'title_value.dart';

class ActivityBottomSheet extends StatelessWidget {
  const ActivityBottomSheet({
    super.key,
    required this.activity,
  });

  final GardenActivity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin0,
      decoration: const BoxDecoration(
        color: naroWhite,
        borderRadius: borderRadius16,
      ),
      padding: padding16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "ACTIVITY DETAILS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize18,
                color: naroColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          // divider
          const ThickHorizontalDivider(
            thickness: 1.5,
            dividerWidth: double.infinity,
            dividerColor: naroColor,
            margin: verticalPadding8,
          ),
          Expanded(
              child: ListView(
            children: [
              TitleValue(
                label: 'ACTIVITY',
                subTitle: activity.activityName,
              ),
              TitleValue(
                label: 'GARDEN',
                subTitle: activity.gardenText,
              ),
              TitleValue(
                label: 'DATE TO BE DONE',
                subTitle: UtilService.formatDate(activity.activityDateToBeDone),
              ),
              TitleValue(
                label: 'DEADLINE',
                subTitle: UtilService.formatDate(activity.activityDueDate),
              ),
              TitleValue(
                label: 'STATUS',
                subTitle: activity.farmerActivityStatus,
              ),
              TitleValue(
                label: 'IS SUBMITTED',
                subTitle: activity.farmerHasSubmitted,
              ),
              TitleValue(
                label: 'DATE SUBMITTED',
                subTitle: UtilService.formatDate(activity.farmerSubmissionDate),
              ),
              TitleValue(
                label: 'DATE DONE',
                subTitle: UtilService.formatDate(activity.activityDateDone),
              ),
              TitleValue(
                label: 'DATE CREATED',
                subTitle: UtilService.formatDate(activity.createdAt),
              ),
              TitleValue(
                label: 'REMARKS',
                subTitle: activity.farmerComment,
              ),
              const ThickHorizontalDivider(
                thickness: 1,
              ),
              Container(
                padding: horizontalPadding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FxText.titleMedium(
                      'ACTIVITY DESCRIPTION',
                      fontWeight: 800,
                      color: Colors.black,
                    ),
                    FxText.bodyMedium(activity.activityDescription),
                  ],
                ),
              ),
            ],
          )),
          const VerticalSpace(of: spacing16),
          activity.tempStatus == 'Submitted'
              ? const SizedBox()
              : Padding(
                  padding: padding4,
                  child: AppButton(
                    onTap: () {
                      // if (activity.tempStatus == 'Submitted') {
                      //   UtilService.toast('${activity.activityName} is already submitted.');
                      //   return;
                      // }
                      Navigator.pop(context);
                      // push(GardenActivitySubmitScreen(activity));
                    },
                    label: "SUBMIT ACTIVITY",
                  ),
                ),
        ],
      ),
    );
  }
}
