import '../../../naro_exporter.dart';

class NavItem {
  // name
  final String name;

  // icon data
  final IconData icon;

  // widget
  final Widget? goToWidget;


  NavItem({
    required this.name,
    required this.goToWidget,
    required this.icon,
  });
}
