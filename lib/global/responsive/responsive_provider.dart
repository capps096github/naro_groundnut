
import '../../naro_exporter.dart';

//* this provides the overall responsiveness of our app

final naroResponsiveProvider = Provider.family<NaroResponsive, BuildContext>((ref, ctx) {
  return NaroResponsive(context: ctx);
});