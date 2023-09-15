import '../../naro_exporter.dart';
import 'sheet_item.dart';

class CreateBottomSheet extends StatelessWidget {
  const CreateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: naroWhite,
        borderRadius: borderRadius16,
      ),
      padding: horizontalPadding16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: verticalPadding16,
            child: Text(
              "What do you want to do?",
              style: TextStyle(
                fontSize: fontSize18,
                color: naroColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ...List.generate(sheetItems.length, (index) {
            // sheet item
            final sheetItem = sheetItems[index];

            return ListTile(
              onTap: () {
                Navigator.pop(context);
                // push(sheetItem.goToWidget);
              },
              leading: Icon(
                sheetItem.icon,
                color: naroColor,
                size: 26,
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: FxText.titleMedium(
                sheetItem.title,
                fontSize: 18,
                color: naroBlack,
              ),
            );
          }),
          const VerticalSpace(of: spacing16),
        ],
      ),
    );
  }
}
