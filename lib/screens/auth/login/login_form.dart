// Project imports:
import '../../../naro_exporter.dart';
import '../components/auth_error_text.dart';
import '../components/auth_option_text.dart';
import '../text_fields/exporter.dart';
import 'login_button.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final loginFormKey = ref.watch(loginFormKeyProvider);

    return AutofillGroup(
      key: const ValueKey('login'),
      child: Form(
        key: loginFormKey,
        child: const Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ///Email
            UsernameField(),
            VerticalSpace(of: spacing16),

            ///Password
            PasswordField(),
            VerticalSpace(of: spacing8),

            ///TODO Forgot Password Button will be active when this functionality is implemented
            // ToForgotPasswordButton(),

            AuthErrorText(),
            LogInButton(),

            VerticalSpace(of: spacing32),

            ///bottom
            AuthOptionText(),
            VerticalSpace(of: spacing24),
          ],
        ),
      ),
    );
  }
}
