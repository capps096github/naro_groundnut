// Project imports:
import '../../../naro_exporter.dart';
import '../components/auth_error_text.dart';
import '../components/auth_heading.dart';
import '../components/auth_option_text.dart';
import '../text_fields/forgot_email_field.dart';
import 'forgot_password_btn.dart';

class ForgotForm extends ConsumerWidget {
  const ForgotForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotFormKey = ref.watch(forgotFormKeyProvider);
    return ExpandedScrollingColumn(
      children: [
        const Spacer(),
        const PaddedLogo(),
        const Spacer(),
        // form
        AutofillGroup(
          key: const ValueKey('forgot'),
          child: Form(
            key: forgotFormKey,
            child: const Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthHeader(heading: 'Forgot Password?'),
                    VerticalSpace(of: spacing16),
                    Text(
                      "Enter your email and we will send you instructions on how to reset your password.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: fontSize14,
                        color: naroBlack,
                      ),
                    ),
                    VerticalSpace(of: spacing32),

                    ForgotEmailField(),
                    VerticalSpace(of: spacing16),

                    ///error text
                    AuthErrorText(),
                    ForgotPasswordButton(),
                    VerticalSpace(of: spacing32),
                    AuthOptionText(),
                    VerticalSpace(of: spacing16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
