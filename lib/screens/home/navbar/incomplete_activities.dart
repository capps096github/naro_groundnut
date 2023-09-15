import '../../../naro_exporter.dart';

class IncompleteActivities extends ConsumerWidget {
  const IncompleteActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const missingCount = 100;

    //
    return Container(
      width: double.infinity,
      padding: padding4,
      decoration: const BoxDecoration(
        color: naroRed,
        borderRadius: borderRadius4,
      ),
      child: InkWell(
        onTap: () {
          //  push( MyActivitiesList());
        },
        child: const Row(
          children: [
            Expanded(
              child: Text(
                "You have $missingCount missing activities.",
                style: TextStyle(
                  color: naroWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            HorizontalSpace(of: spacing8),
            Text(
              "View >",
              style: TextStyle(
                color: naroWhite,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: naroWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
