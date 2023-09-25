import '../../../naro_exporter.dart';

class Greeting extends ConsumerWidget {
  const Greeting({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // greeting text
    final greeting = ref.watch(greetingProvider);
    final naroUser = ref.watch(naroUserProvider) ?? defaultUser;

    return Column(
      children: [
        Text(
          greeting,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: naroWhite,
            fontSize: fontSize16,
          ),
        ),
        Text(
          naroUser.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: naroWhite,
            fontSize: fontSize24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// greeting provider
final greetingProvider = Provider<String>((ref) {
  // date
  final now = DateTime.now();
  final hour = now.hour;

  final greeting = hour < 12
      ? "Good Morning,"
      : hour < 18
          ? "Good Afternoon,"
          : "Good Evening,";

  return greeting;
});
