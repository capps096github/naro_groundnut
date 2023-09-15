// Project imports:

import '../../../naro_exporter.dart';
import '../../market/market_place.dart';
import 'nav_item.dart';

List<NavItem> navItems = [
  NavItem(
    name: 'Create New',
    icon: Icons.add,
    goToWidget: null,
  ),
  NavItem(
    name: 'My Gardens',
    icon: Icons.yard,
    goToWidget: const MyGardens(),
  ),
  // NavItem(
  //   name: 'My Activities',
  //   icon: Icons.insights,
  //   goToWidget: const MyActivities(),
  // ),
  NavItem(
    name: 'Market Place',
    icon: Icons.storefront,
    goToWidget: const MarketPlace(),
  ),
];
