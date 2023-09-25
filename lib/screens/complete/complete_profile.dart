import '../../naro_exporter.dart';
import '../home/navbar/greeting.dart';
import 'items_data.dart';
import 'profile_card.dart';

class CompleteProfile extends ConsumerWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileItems = ref.watch(profileItemsProvider);

    return Padding(
      padding: padding16,
      child: ExpandedScrollingColumn(
        children: [
          const VerticalSpace(of: spacing8),
          const Greeting(),
          const ThickHorizontalDivider(dividerColor: naroSecondaryColor),
          const Text(
            "Which of these best describes you?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: naroSecondaryColor,
              fontSize: fontSize24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            "Select one to complete your profile",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: naroWhite,
              fontSize: fontSize14,
            ),
          ),
          const VerticalSpace(of: spacing16),
          //
          ...List.generate(
            profileItems.length,
            (index) => ProfileCard(cardItem: profileItems[index]),
          ),
        ],
      ),
    );
  }
}
