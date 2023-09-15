import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';
import 'field_label.dart';

class GnutsVarietiesField extends ConsumerWidget {
  const GnutsVarietiesField({super.key, required this.formField});

// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cropVarietiesInit = ref.watch(cropVarietiesInitializer);

    //
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        FormLabel(
          form: formField,
          labelText: formField.label,
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
            borderRadius: borderRadius6,
            border: Border.all(
              color: naroColor,
              width: 1,
            ),
          ),
          child: cropVarietiesInit.when(
            data: (cropVarieties) {
              return CropVarietiesBody(
                formField: formField,
                cropVarieties: cropVarieties,
              );
            },
            loading: () => const EmptySpace(),
            error: (error, stackTrace) => ErrorWidget(error),
          ),
        ),
      ],
    );
  }
}

final cropVarietiesInitializer = FutureProvider<List<CropVariety>>((ref) async {
  final cropService = ref.watch(cropVariertyServiceProvider);
  return await cropService.initializeVariaties();
});

class CropVarietiesBody extends ConsumerStatefulWidget {
  const CropVarietiesBody({
    super.key,
    required this.formField,
    required this.cropVarieties,
  });

  final AppFormField formField;

  final List<CropVariety> cropVarieties;

  @override
  ConsumerState<CropVarietiesBody> createState() => _CropVarietiesBodyState();
}

class _CropVarietiesBodyState extends ConsumerState<CropVarietiesBody> {
  // sorted drop down items
  late List<String> sortedDropDownItems;

  @override
  void initState() {
    final cropVarieties = widget.cropVarieties;

    // a list of all crop varieties names as dropdown items
    final List<String> cropVarietiesNames = (cropVarieties.isNotEmpty)
        ? cropVarieties.map((variety) {
            // the name text is as Cucumber, Cucumber English
            // covert it to (Cucumber) Cucumber English and return that
            final String nameText =
                "(${variety.nameText.split(",")[0]}) ${variety.nameText.split(",")[1]}";
            return nameText;
          }).toList()
        : [
            "Cucumber, Cucumber English",
            "Cucumber, Cucumber Local",
            "Cucumber, Cucumber Long",
            "Cucumber, Cucumber Short",
          ];

    sortedDropDownItems = cropVarietiesNames..sort();

    updateFieldProvider();

    super.initState();
  }

  void updateFieldProvider() async {
    // delay so that we can update the provider without getting an error
    await Future.delayed(twentyMilliseconds, () {
      // set the initial value of the form field
      ref.read(widget.formField.stateProvider.notifier).state = sortedDropDownItems.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    // formField
    final formField = widget.formField;

    // formvalue pass in the initial value here
    final fieldValue = ref.watch(formField.stateProvider);

    // initial value will be the first item in the dropdown list only if the form value is empty ''
    final formValue = fieldValue.isEmpty ? sortedDropDownItems.first : fieldValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: DropdownButton<String>(
            underline: const EmptySpace(),
            borderRadius: borderRadius8,
            value: formValue,
            alignment: Alignment.centerRight,
            style: GoogleFonts.lato(color: naroColor),
            menuMaxHeight: 500,
            icon: const EmptySpace(),
            onChanged: (newValue) {
              ref.read(formField.stateProvider.notifier).state = newValue;
            },
            items: List.generate(
              sortedDropDownItems.length,
              (index) {
                // chopped Value  this shows the value chopped to the first 20 characters and the rest represented by an ellipsis
                // but first check if string hs more than 20 characters before we chop it
                final value = sortedDropDownItems[index];
                final choppedValue = value;
                // value.length > 18 ? '${value.substring(0, 18)}...' : value;

                return DropdownMenuItem<String>(
                  value: sortedDropDownItems[index],
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
    );
  }
}
