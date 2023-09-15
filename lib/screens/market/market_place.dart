import '../../naro_exporter.dart';
import 'product_tile.dart';

class MarketPlace extends ConsumerWidget {
  const MarketPlace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market Place"),
      ),
      body: RefreshIndicator(
        color: naroWhite,
        backgroundColor: naroColor,
        onRefresh: () async {},
        child: ListView.separated(
          padding: verticalPadding8,
          separatorBuilder: (context, index) {
            return const ThickHorizontalDivider(
              dividerWidth: double.infinity,
              thickness: 1,
              margin: margin8,
            );
          },
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // final garden = gardens[index];
            final product = Product.random();
            return ProductTile(product: product);
          },
        ),
      ),
    );
  }
}
