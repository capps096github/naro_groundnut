
import '../../naro_exporter.dart';
import 'product_screen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final gardenPic = product.photo.isEmpty ? defaultProfilePic : product.photo;
    return InkWell(
      onTap: () => push(ProductScreen(product: product)),
      child: Container(
        padding: horizontalPadding8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(
              imageUrl: gardenPic,
              height: 60,
              width: 60,
              borderRadius: borderRadius6,
              fit: BoxFit.fill,
            ),
            const HorizontalSpace(of: spacing8),
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleMedium(
                    product.name.toUpperCase(),
                    maxLines: 2,
                    fontWeight: 800,
                    color: naroBlack,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const VerticalSpace(of: 6),
                  FxContainer(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    borderRadiusAll: 0,
                    color: naroColor,
                    child: FxText.bodyLarge(
                      "UGX ${UtilService.moneyFormat(product.price).toString().toUpperCase()}",
                      fontWeight: 800,
                      color: naroWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Icon(
                        Icons.shield,
                        size: 12,
                        color: naroColor,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      FxText.bodySmall(
                        product.state.toUpperCase(),
                        color: naroGrey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: naroColor,
                      ),
                      const SizedBox(width: 2),
                      FxText.bodySmall(
                        UtilService.formatDate(product.createdAt),
                        maxLines: 1,
                        color: naroGrey,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
