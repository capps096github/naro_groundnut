import '../../naro_exporter.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: naroWhite,
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: padding8,
        child: ExpandedScrollingColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(
              imageUrl: defaultProfilePic,
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              borderRadius: borderRadius6,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            const VerticalSpace(of: 20),
            Text(
              product.details,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText(
                          'PRICE',
                          color: naroBlack,
                          fontWeight: 800,
                        ),
                        const SizedBox(height: 5),
                        FxContainer(
                          color: naroColor,
                          borderRadiusAll: 0,
                          paddingAll: 5,
                          child: FxText.bodyLarge(
                            "UGX ${UtilService.moneyFormat(product.price)} ".toUpperCase(),
                            color: naroWhite,
                            fontWeight: 800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpace(of: 10),
            SectionText(title: 'STATE', subTitle: product.state),
            SectionText(title: 'OFFER TYPE', subTitle: product.offerType),
            const SectionText(title: 'DETAILS', subTitle: ''),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: naroWhite,
        padding: padding8,
        child: AppButton(
          label: "CONTACT THE SELLER",
          onTap: () async =>
              await linkLauncher("tel:${product.type.length < 5 ? '+256783204665' : product.type}"),
        ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  const SectionText({super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: FxText.bodyLarge(
            '$title :'.toUpperCase(),
            textAlign: TextAlign.right,
            color: naroColor,
            fontWeight: 700,
          ),
        ),
        const HorizontalSpace(of: 4),
        Expanded(
            child: FxText.bodyLarge(
          subTitle,
          maxLines: 10,
        )),
      ],
    );
  }
}
