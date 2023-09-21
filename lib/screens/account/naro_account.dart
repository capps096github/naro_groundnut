import '../../naro_exporter.dart';
import 'about_item.dart';
import 'components/about_tile.dart';
import 'components/section_title.dart';

class NaroAccount extends StatelessWidget {
  const NaroAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Padding(
        padding: padding16,
        child: ExpandedScrollingColumn(
          children: [
            const SectionTitle(sectionText: 'My Account'),
            ...List.generate(
              myAccountItems.length,
              (index) => AboutTile(aboutItem: myAccountItems[index]),
            ),
            const SectionTitle(sectionText: 'My Content & Activity'),
            ...List.generate(
              myContentItems.length,
              (index) => AboutTile(aboutItem: myContentItems[index]),
            ),
            const SectionTitle(sectionText: 'Support'),
            ...List.generate(
              supportItems.length,
              (index) => AboutTile(aboutItem: supportItems[index]),
            ),
          ],
        ),
      ),
    );
  }
}
