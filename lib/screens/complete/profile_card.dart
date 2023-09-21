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
                      borderRadius: borderRadius8,
                      border: Border.all(
                        color: borderColor,
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: borderRadius6,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppImage(
                            imageUrl: cardItem.itemThumbnail,
                            fit: BoxFit.fill,
                          ),

                          // gradient
                          CardGradient(gradientColor: borderColor.withOpacity(.5)),

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
