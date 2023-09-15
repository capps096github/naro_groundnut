import '../../naro_exporter.dart';

class SheetItem {
  // icon
  final IconData icon;

  // title
  final String title;

  // go to widget
  final Widget goToWidget;

  SheetItem({
    required this.icon,
    required this.title,
    required this.goToWidget,
  });
}

// list of SheetItem
final List<SheetItem> sheetItems = [
  // Register new garden
  SheetItem(
    icon: Icons.add,
    title: "Register New Garden",
    goToWidget: const EmptySpace(),
  ),

  SheetItem(
    icon: Icons.add_circle,
    title: "Create new activity",
    goToWidget: const EmptySpace(),
  ),
  SheetItem(
    icon: Icons.add_shopping_cart,
    title: "Sell Groundnuts",
    goToWidget: const EmptySpace(),
  ),
  SheetItem(
    icon: Icons.help,
    title: "Ask the expert",
    goToWidget: const EmptySpace(),
  ),
];
