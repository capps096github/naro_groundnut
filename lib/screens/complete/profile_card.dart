import '../../naro_exporter.dart';
import '../forms/components/card_gradient.dart';
import '../forms/form_detail_screen.dart';
import 'card_label.dart';
import 'profile_card_item.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.cardItem,
  });

  final ProfileCardItem cardItem;

  @override
  Widget build(BuildContext context) {
    const borderColor = naroSecondaryColor;

    //
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: spacing4),
        child: InkWell(
          onTap: () => push(FormDetailScreen(form: cardItem.form)),
          customBorder: const RoundedRectangleBorder(borderRadius: borderRadius8),
          child: Ink(
            child: Padding(
              padding: padding2,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: maxCardHeight),
                  child: Container(
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: borderRadius8,
                      border: Border.all(
                        color: borderColor,
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: borderRadius8,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppImage(
                            imageUrl: cardItem.itemThumbnail,
                            fit: BoxFit.fill,
                            borderRadius: borderRadius6,
                          ),

                          // gradient
                          const CardGradient(gradientColor: borderColor),

                          // content
                          MarketCardLabel(cardItem: cardItem),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
