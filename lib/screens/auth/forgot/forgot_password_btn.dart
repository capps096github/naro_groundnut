// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import '../../../naro_exporter.dart';
import '../functions/forgot_pass.dart';

class ForgotPasswordButton extends ConsumerStatefulWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends ConsumerState<ForgotPasswordButton> {
  // istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final forgotFormKey = ref.watch(forgotFormKeyProvider);
    final email = ref.watch(forgotEmailProvider);

    return CircularProgressAppButton(
      text: "SEND MAIL",
      isTapped: isButtonTapped,
      onTap: () async {
        // Unfocus Keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (forgotFormKey.currentState!.validate()) {
          //  update button state
          setState(() {
            isButtonTapped = true;
          });

          // send reset password email
          await forgotAkataboPassword(email: email).then((_) {
            // update the isResetEmailSent
            ref.read(isResetEmailSentProvider.notifier).state = true;

            // ignore: avoid_printter
            printer("Pass reset email sent");

            // update button state
            if (mounted) {
              setState(() {
                isButtonTapped = false;
              });
            }

            // clear the form after sign in
            forgotFormKey.currentState!.reset();
          });
        }
      },
      textColor: naroWhite,
      buttonColor: naroColor,
      icon: CupertinoIcons.mail_solid,
    );
  }
}
