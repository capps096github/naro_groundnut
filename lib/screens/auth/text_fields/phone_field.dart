import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

class PhoneNumberField extends ConsumerWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'phone',
      onChanged: (newValue) {
        ref.read(phoneNumberProvider.notifier).state = newValue;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Your Phone Number is Required e.g. 0780000000 ";
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      prefixIcon: CupertinoIcons.phone_fill,
      hintText: 'Your Phone Number',
      autofillHints: const [
        AutofillHints.telephoneNumber,
        AutofillHints.telephoneNumberLocal,
        AutofillHints.telephoneNumberNational,
      ],
      labelText: 'Phone Number',
    );
  }
}
