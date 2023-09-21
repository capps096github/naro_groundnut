import '../../naro_exporter.dart';
import '../providers/new_garden_providers.dart';

final newGardenFormFields = [
  AppFormField(
    label: 'Garden Name',
    hint: 'Enter garden name',
    stateProvider: gardenNameProvider,
  ),
  if (!isNaroWindows)
    AppFormField(
      label: 'Groundnut Variety',
      hint: 'Enter groundnut variety',
      stateProvider: groundnutVarietyProvider,
      fieldType: FieldType.gnutVarietyDropdown,
    ),
  AppFormField(
    label: 'Planting Date',
    hint: 'Enter planting date',
    stateProvider: plantingDateProvider,
    fieldType: FieldType.date,
  ),
  AppFormField(
    label: 'Production Scale',
    hint: 'Enter production scale',
    stateProvider: gardenProductionScaleProvider,
    dropDownItems: [
      "Small Scale",
      "Medium Scale",
      "Large Scale",
    ],
  ),
  AppFormField(
    label: "Garden Size (in Acres)",
    hint: "Your garden size in Acres",
    stateProvider: gardenSizeProvider,
    keyboardType: TextInputType.number,
  ),
  AppFormField(
    label: 'Garden Details',
    hint: 'Enter garden details',
    stateProvider: gardenDetailsProvider,
    maxLines: 5,
  ),
];
