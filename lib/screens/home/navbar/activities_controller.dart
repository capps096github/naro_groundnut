import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

// list of string
final List<String> scanTitles = [
  "Upcoming",
  "Completed",
];

class ActivitiesController extends ConsumerWidget {
  const ActivitiesController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // currentValue
    final activityControlIndex = ref.watch(activityControlIndexProvider);

    return Container(
      constraints: const BoxConstraints(maxWidth: 750),
      width: 600,
      child: CupertinoSegmentedControl<int>(
        padding: const EdgeInsets.all(0),
        selectedColor: naroSecondaryColor,
        borderColor: naroSecondaryColor,
        unselectedColor: naroColor,
        children: <int, Widget>{
          0: Padding(
            padding: padding8,
            child: Text(
              "${scanTitles[0]} Activities",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: (activityControlIndex == 0) ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          1: Padding(
            padding: padding8,
            child: Text(
              "${scanTitles[1]} Activities",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: (activityControlIndex == 1) ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        },
        // pressedColor: naroSecondaryColor,
        onValueChanged: (newValue) =>
            ref.read(activityControlIndexProvider.notifier).state = newValue,
        groupValue: activityControlIndex,
      ),
    );
  }
}

// scan control index
final activityControlIndexProvider = StateProvider<int>((ref) => 0);
