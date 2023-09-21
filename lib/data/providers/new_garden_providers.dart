import '../../naro_exporter.dart';

final gardenPhotoProvider = StateProvider<MultipartFile?>((_) => null);
final gardenNameProvider = StateProvider<String>((_) => '');
final plantingDateProvider = StateProvider<DateTime>((_) => DateTime.now());
final groundnutVarietyProvider = StateProvider<String>((_) => '');
final gardenDetailsProvider = StateProvider<String>((_) => '');
final gardenIdProvider = StateProvider<int>((_) => 0);
final gardenProductionScaleProvider = StateProvider<String>((_) => '');
final gardenSizeProvider = StateProvider<String>((_) => '');

final newGardenProvider = Provider<NewGarden>((ref) {
  final gardenPhoto = ref.watch(gardenPhotoProvider);
  final gardenName = ref.watch(gardenNameProvider);
  final plantingDate = ref.watch(plantingDateProvider);
  final groundnutVariety = ref.watch(groundnutVarietyProvider);
  final gardenDetails = ref.watch(gardenDetailsProvider);
  final gardenId = ref.watch(gardenIdProvider);
  final productionScale = ref.watch(gardenProductionScaleProvider);
  final gardenSize = ref.watch(gardenSizeProvider);

  return NewGarden(
    gardenPhoto: gardenPhoto,
    gardenName: gardenName,
    groundnutVariety: groundnutVariety,
    plantingDate: plantingDate,
    productionScale: productionScale,
    gardenSize: gardenSize,
    gardenDetails: gardenDetails,
    gardenId: gardenId,
  );
});

final newGardenFormKeyProvider = Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());
