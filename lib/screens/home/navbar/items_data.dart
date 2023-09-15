// Project imports:

import '../../../naro_exporter.dart';
import 'nav_item.dart';

List<NavItem> navItems = [
  NavItem(
    name: 'Create New',
    icon: Icons.add,
    goToWidget: const NaroPlaceholder(title: 'Track'),
  ),
  NavItem(
    name: 'My Gardens',
    icon: Icons.yard,
    goToWidget: const NaroPlaceholder(title: 'My Gardens'),
  ),
  NavItem(
    name: 'My Activities',
    icon: Icons.insights,
    goToWidget: const NaroPlaceholder(title: 'My Activities'),
  ),
  NavItem(
    name: 'Market Place',
    icon: Icons.storefront,
    goToWidget: const NaroPlaceholder(title: 'Market Place'),
  ),
];
