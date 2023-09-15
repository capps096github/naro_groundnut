import '../../../naro_exporter.dart';

// final  home screen index is O
const defaultHomeScreenIndex = 0;

// this returns an index of the selected navbar item
final selectedNavBarIndexProvider = StateProvider<int>((ref) => defaultHomeScreenIndex);
