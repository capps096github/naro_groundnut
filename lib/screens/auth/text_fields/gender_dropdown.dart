import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

class GenderDropdown extends ConsumerWidget {
  const GenderDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // formvalue pass in the initial value here
    final formValue = ref.watch(genderProvider);

    // sorted drop down items
    final sortedDropDownItems = [
      selectGender,
      "Male",
      "Female",
      "Rather not say",
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        const Text(
          "Gender",
          style: TextStyle(
            fontSize: fontSize14,
            color: naroColor,
          ),
        ),
        const VerticalSpace(of: spacing4),
        //
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: spacing2,
            horizontal: spacing8,
          ),
          decoration: BoxDecoration(
            color: naroColor.withOpacity(.05),
            borderRadius: borderRadius120,
            border: Border.all(
              color: naroColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: DropdownButton<String>(
                  underline: const EmptySpace(),
                  borderRadius: borderRadius16,
                  value: formValue,
                  alignment: Alignment.centerRight,
                  style: GoogleFonts.lato(color: naroColor),
                  menuMaxHeight: 500,
                  focusColor: naroTransparent,
                  icon: const EmptySpace(),
                  onChanged: (newValue) {
                    // set gender to empty string if newValue is null and not equal to selectGender
                    if (newValue != null) {
                      ref.read(genderProvider.notifier).state = newValue;
                    }
                  },
                  items: List.generate(
                    sortedDropDownItems.length,
                    (index) {
                      // chopped Value  this shows the value chopped to the first 20 characters and the rest represented by an ellipsis
                      // but first check if string hs more than 20 characters before we chop it
                      final value = sortedDropDownItems[index];
                      final choppedValue = value;

                      // if is selectGender disable it
                      final enabled = value != selectGender;

                      return DropdownMenuItem<String>(
                        value: sortedDropDownItems[index],
                        enabled: enabled,
                        child: Text(choppedValue),
                      );
                    },
                  ),
                  selectedItemBuilder: (context) => List.generate(
                    sortedDropDownItems.length,
                    (index) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(formValue),
                      );
                    },
                  ),
                ),
              ),
              const HorizontalSpace(of: spacing8),
              const Icon(
                CupertinoIcons.chevron_down_circle_fill,
                color: naroColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
