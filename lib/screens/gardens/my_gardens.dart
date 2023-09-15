import '../../naro_exporter.dart';
import 'register_garden.dart';
import 'garden_tile.dart';

class MyGardens extends ConsumerWidget {
  const MyGardens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Gardens"),
        actions: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: borderRadius8,
              color: naroSecondaryColor,
            ),
            margin: margin4,
            child: InkWell(
              borderRadius: borderRadius8,
              onTap: () => push(const RegisterGarden()),
              child: const Padding(
                padding: padding8,
                child: Icon(
                  Icons.add,
                  color: naroColor,
                ),
              ),
            ),
          ),
        ],
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
            final garden = Garden.random();
            return GardenTile(garden: garden);
          },
        ),
      ),
    );
  }
}
