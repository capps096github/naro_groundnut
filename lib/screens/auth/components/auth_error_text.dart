import '../../../naro_exporter.dart';

class AuthErrorText extends ConsumerWidget {
  const AuthErrorText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(naroAPIErrorTextProvider);

    // is empty signifies no error
    final isNoError = errorText.isEmpty;

    // this is the error text that will be displayed in a red transparent like container
    return AnimatedOpacity(
      opacity: isNoError ? 0 : 1,
      duration: halfSeconds,
      child: AnimatedContainer(
        duration: halfSeconds,
        width: double.infinity,
        // this is to add a little padding to the error text from the bottom
        margin: EdgeInsets.symmetric(vertical: isNoError ? 0 : spacing16),
        decoration: BoxDecoration(
          color: naroRed.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding8,
        child: Text(
          errorText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: naroWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
