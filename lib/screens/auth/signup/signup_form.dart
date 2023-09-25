// Project imports:
import '../../../data/local/signup_fields.dart';
import '../../../naro_exporter.dart';
import '../components/auth_error_text.dart';
import '../components/auth_option_text.dart';
import '../text_fields/exporter.dart';
import 'signup_button.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpFormKey = ref.watch(signUpFormKeyProvider);

    return AutofillGroup(
      key: const ValueKey('SignUp'),
      child: Form(
        key: signUpFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(signUpFormFields.length, (index) {
              final formField = signUpFormFields[index];
              return AppFormFieldWidget(formField: formField);
            }),

            ///Password
            const PasswordField(isSignUpScreen: true),
            const VerticalSpace(of: spacing16),

            ///Confirm Password
            const ConfirmPasswordField(),
            const VerticalSpace(of: spacing16),

            ///error text
            const AuthErrorText(),

            ///Sign Up
            const SignUpButton(),
            const VerticalSpace(of: spacing16),

            ///
            const AuthOptionText(),
            const VerticalSpace(of: spacing16),
          ],
        ),
      ),
    );
  }
}
