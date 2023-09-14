// Flutter imports:

// Project imports:
import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

// Email Verification RegExp
final emailExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class EmailField extends ConsumerWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'email_field',
      onChanged: (email) {
        if (emailExp.hasMatch(email)) {
          ref.read(emailProvider.notifier).state = email;
        }
      },
      validator: (email) {
        if (email == null || email.isEmpty) {
          return ' Please Enter your Email ';
        }
        if (!emailExp.hasMatch(email)) {
          return " Invalid Email Address ";
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CupertinoIcons.mail,
      hintText: 'Email',
      autofillHints: const [AutofillHints.email],
      labelText: 'Email',
    );
  }
}
