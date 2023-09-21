import '../../../naro_exporter.dart';
import 'profile_card_item.dart';

class MarketCardLabel extends StatelessWidget {
  const MarketCardLabel({
    super.key,
    required this.cardItem,
  });

  final ProfileCardItem cardItem;

  @override
  Widget build(BuildContext context) {
    const formTextColor = naroWhite;

    return Padding(
      padding: padding8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Text(
            cardItem.title,
            style: const TextStyle(
              color: formTextColor,
              fontSize: fontSize18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpace(of: spacing2),
          Text(
            cardItem.description,
            maxLines: 2,
            style: const TextStyle(
              color: formTextColor,
              fontSize: fontSize14,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
