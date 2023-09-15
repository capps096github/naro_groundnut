// Project imports:
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
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///username
            UsernameField(),
            VerticalSpace(of: spacing16),

            //gender
            GenderDropdown(),
            VerticalSpace(of: spacing16),

            // district
            DistrictField(),
            VerticalSpace(of: spacing16),

            // subcounty
            SubCountyField(),
            VerticalSpace(of: spacing16),

            // village
            VillageField(),
            VerticalSpace(of: spacing16),

            // phone number
            PhoneNumberField(),
            VerticalSpace(of: spacing16),

            ///Email
            EmailField(),
            VerticalSpace(of: spacing16),

            ///Password
            PasswordField(isSignUpScreen: true),
            VerticalSpace(of: spacing16),

            ///Confirm Password
            ConfirmPasswordField(),
            VerticalSpace(of: spacing16),

            ///error text
            AuthErrorText(),

            ///Sign Up
            SignUpButton(),
            VerticalSpace(of: spacing16),

            ///
            AuthOptionText(),
            VerticalSpace(of: spacing16),
          ],
        ),
      ),
    );
  }
}
