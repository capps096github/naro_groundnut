import 'package:image_picker/image_picker.dart';

import '../../../naro_exporter.dart';
import 'providers.dart';
import 'tap_to_pick_file.dart';

class PickArtwork extends ConsumerStatefulWidget {
  const PickArtwork({super.key});

  @override
  ConsumerState<PickArtwork> createState() => _PickArtworkState();
}

class _PickArtworkState extends ConsumerState<PickArtwork> {
  // is picking
  bool isPickingImage = false;

  //
  ImageSource imageSource = ImageSource.gallery;
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DottedBorder(
          dashPattern: const [8, 4],
          radius: const Radius.circular(8),
          borderType: BorderType.RRect,
          color: naroColor,
          child: Material(
            color: naroWhite.withOpacity(.6),
            shape: const RoundedRectangleBorder(borderRadius: borderRadius8),
            clipBehavior: Clip.antiAlias,
            child: TapToPickFile(
              fromCamera: () async => await pickImage(ImageSource.camera),
              fromGallery: () async => await pickImage(ImageSource.gallery),
            ),
          ),
        ),
        if (isPickingImage) ...[
          const Padding(
            padding: padding16,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),

          // text
          const Text(
            "Picking your receipt file, Please wait as UI refreshes ...",
            style: TextStyle(
              color: naroColor,
              fontSize: fontSize12,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> pickImage(ImageSource imageSource) async {
    // reset the image
    ref.read(pickedImageFileProvider.notifier).state = null;

    // set is picking to true
    setState(() {
      isPickingImage = true;
    });

    final imagePicker = ImagePicker();

    // uploadedImageFileProvider
    await imagePicker.pickImage(source: imageSource).then(
      (selectedImageFile) {
        // set is picking to false
        setState(() {
          isPickingImage = false;
        });

        // update
        ref.read(pickedImageFileProvider.notifier).state = selectedImageFile;
      },
    );
  }
}
