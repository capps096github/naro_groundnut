import '../../naro_exporter.dart';

final farmerFormFields = [
  AppFormField(
    label: 'Level of Education',
    hint: 'Enter level of education',
    stateProvider: levelOfEducationProvider,
    dropDownItems: [
      "Primary",
      "Secondary",
      "Tertiary",
      "None",
    ],
  ),
  AppFormField(
    label: 'Marital Status',
    hint: 'Enter marital status',
    stateProvider: maritalStatusProvider,
    dropDownItems: [
      "Single",
      "Married",
      "Divorced",
      "Widowed",
    ],
  ),
  AppFormField(
    label: 'Number of Dependants',
    hint: 'Enter number of dependants',
    stateProvider: numberOfDependantsProvider,
    keyboardType: TextInputType.number,
  ),
  AppFormField(
    label: 'Farmers Group',
    hint: 'Enter farmers group',
    stateProvider: farmersGroupProvider,
  ),
  AppFormField(
    label: 'Farming Experience',
    hint: 'Enter farming experience',
    stateProvider: farmingExperienceProvider,
    maxLines: 5,
  ),
  AppFormField(
    label: 'Production Scale',
    hint: 'Enter production scale',
    stateProvider: productionScaleProvider,
  ),
];
