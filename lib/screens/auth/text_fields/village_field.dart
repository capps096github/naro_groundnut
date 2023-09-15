 
import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

class VillageField extends ConsumerWidget {
  const VillageField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'village',
      onChanged: (newValue) {
        ref.read(villageProvider.notifier).state = newValue;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Your Village is Required e.g. Kyanamira ";
        }
        return null;
      },
      keyboardType: TextInputType.name,
      prefixIcon: CupertinoIcons.app_badge_fill,
      hintText: 'Your Village',
      autofillHints: const [
        AutofillHints.addressCity,
        AutofillHints.addressState,
        AutofillHints.location,
      ],
      labelText: 'Village',
    );
  }
}