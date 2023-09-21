import '../../naro_exporter.dart';
import '../model/form/farmer_form.dart';

final levelOfEducationProvider = StateProvider<String>((_) => '');
final maritalStatusProvider = StateProvider<String>((_) => '');
final numberOfDependantsProvider = StateProvider<String>((_) => '');
final farmersGroupProvider = StateProvider<String>((_) => '');
final farmingExperienceProvider = StateProvider<String>((_) => '');
final productionScaleProvider = StateProvider<String>((_) => '');

// newFarmerProvider FarmerForm
final newFarmerProvider = Provider<FarmerForm>((ref) {
  final levelOfEducation = ref.watch(levelOfEducationProvider);
  final maritalStatus = ref.watch(maritalStatusProvider);
  final numberOfDependants = ref.watch(numberOfDependantsProvider);
  final farmersGroup = ref.watch(farmersGroupProvider);
  final farmingExperience = ref.watch(farmingExperienceProvider);
  final productionScale = ref.watch(productionScaleProvider);

  return FarmerForm(
    levelOfEducation: levelOfEducation,
    maritalStatus: maritalStatus,
    numberOfDependants: numberOfDependants,
    farmersGroup: farmersGroup,
    farmingExperience: farmingExperience,
    productionScale: productionScale,
  );
});

final farmerFormKeyProvider = Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());
