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
      padding: const EdgeInsets.only(bottom: 10),
      margin: margin0,
      decoration: const BoxDecoration(
        color: naroWhite,
        borderRadius: borderRadius16,
      ),
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        FxText.titleLarge(
                          "ACTIVITY DETAILS".toUpperCase(),
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: 700,
                        ),
                        const Spacer(),
                        InkWell(
                          child: const Icon(
                            Icons.close,
                            color: naroColor,
                            size: 25,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
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
            activity.tempStatus == 'Submitted'
                ? const SizedBox()
                : Container(
                    padding: padding4,
                    child: FxButton.block(
                      onPressed: () {
                        // if (activity.tempStatus == 'Submitted') {
                        //   UtilService.toast('${activity.activityName} is already submitted.');
                        //   return;
                        // }
                        Navigator.pop(context);
                        // push(GardenActivitySubmitScreen(activity));
                      },
                      backgroundColor: naroColor,
                      borderRadiusAll: 8,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                      child: FxText(
                        "SUBMIT ACTIVITY",
                        color: naroWhite,
                        fontWeight: 700,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
