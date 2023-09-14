// Project imports:
import '../../../naro_exporter.dart';
import 'email_sent.dart';
import 'forgot_form.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResetEmailSent = ref.watch(isResetEmailSentProvider);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: isResetEmailSent ? const EmailSent() : const ForgotForm(),
    );
  }
}
