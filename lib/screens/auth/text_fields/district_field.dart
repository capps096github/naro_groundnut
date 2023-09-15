// Project imports:
import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

final validatorRegex = RegExp(r'^[A-Za-z ]+$');

class DistrictField extends ConsumerWidget {
  const DistrictField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    return CustomTextField(
      restorationId: 'district',
      onChanged: (newValue) {
        if (validatorRegex.hasMatch(newValue)) {
          ref.read(districtProvider.notifier).state = newValue;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Your District is Required e.g. Cephas ";
        }

        if (!validatorRegex.hasMatch(value)) {
          return "District must have only Alphabets";
        }
        return null;
      },
      keyboardType: TextInputType.name,
      prefixIcon: CupertinoIcons.location_fill,
      hintText: 'District',
      autofillHints: const [
        AutofillHints.location,
        AutofillHints.addressCity,
        AutofillHints.addressState,
      ],
      labelText: 'District',
    );
  }
}
