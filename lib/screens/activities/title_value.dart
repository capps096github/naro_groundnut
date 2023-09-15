import '../../naro_exporter.dart';

class TitleValue extends StatelessWidget {
  const TitleValue({
    super.key,
    required this.label,
    required this.subTitle,
  });

  // label
  final String label, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: spacing4, horizontal: spacing16),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: FxText.bodyLarge(
              '$label : '.toUpperCase(),
              textAlign: TextAlign.left,
              color: Colors.black,
              fontWeight: 700,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: FxText.bodyLarge(
              subTitle.isEmpty ? "-" : subTitle,
              textAlign: TextAlign.right,
              fontWeight: 500,
            ),
          ),
        ],
      ),
    );
  }
}
