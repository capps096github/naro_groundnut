// Project imports:
import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

class SubCountyField extends ConsumerWidget {
  const SubCountyField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    return CustomTextField(
      restorationId: 'sub-county',
      onChanged: (newValue) {
        ref.read(subcountyProvider.notifier).state = newValue;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Your Sub-County is Required e.g. Kyanamira ";
        }

        return null;
      },
      keyboardType: TextInputType.name,
      prefixIcon: CupertinoIcons.app_fill,
      hintText: 'Your Sub-County',
      autofillHints: const [
        AutofillHints.addressCity,
        AutofillHints.addressState,
        AutofillHints.location,
      ],
      labelText: 'Sub-County',
    );
  }
}
