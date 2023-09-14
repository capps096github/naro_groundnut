// Project imports:

import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';
import '../components/auth_heading.dart';
import '../components/auth_option_text.dart';

class EmailSent extends ConsumerWidget {
  const EmailSent({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ExpandedScrollingColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const PaddedLogo(),
        const Spacer(),
        const AuthHeader(heading: "We've sent you an Email"),
        const VerticalSpace(of: spacing16),
        const Text(
          "We have sent instructions on how to reset your Password to your Email.",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: fontSize14,
            color: naroBlack,
          ),
        ),
        const VerticalSpace(of: spacing32),
        const Text(
          "Didn't See the Email?",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: naroBlack,
            fontSize: fontSize20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpace(of: spacing8),
        const Text(
          "Check your spam folder, or click the TRY AGAIN button below to resend the email.",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: fontSize14,
            color: naroBlack,
          ),
        ),
        const VerticalSpace(of: spacing16),
        AppButton(
          label: "TRY AGAIN",
          icon: CupertinoIcons.arrow_2_squarepath,
          onTap: () {
            // Is Email Sent
            ref.read(isResetEmailSentProvider.notifier).state = false;
          },
          textColor: naroWhite,
          buttonColor: naroColor,
        ),
        const Spacer(),
        const AuthOptionText(question: "Reset Password?"),
        const VerticalSpace(of: spacing16),
      ],
    );
  }
}
