import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

import '../../../naro_exporter.dart';

//  ? b) Image
// TODO add ability to upload image from camera

/// uploaded Image file XFile? from gallery
/// Be sure to rest it to null after upload is complete so that other forms can use it
final pickedImageFileProvider = StateProvider<XFile?>((ref) {
  return null;
});

/// tells us whether the thumbnail upload is completed from gallery or camera
final isReceiptPickedProvider = StateProvider<bool>((ref) {
  // get the image file from the provider
  final XFile? pickedImageFile = ref.watch(pickedImageFileProvider);

  return (pickedImageFile != null);
});

/// image aspact ratio

// aspect ratio
final aspectRatioProvider = Provider<double>((ref) {
  final XFile? pickedImageFile = ref.watch(pickedImageFileProvider);

  if (pickedImageFile != null) {
    // file
    final imageFile = File(pickedImageFile.path).readAsBytesSync();

    // image
    final image = img.decodeImage(imageFile);

    // check if image is null
    if (image != null) {
      // image width
      final imageWidth = image.width.toDouble();
      final imageHeight = image.height.toDouble();
      final aspectRatio = imageWidth / imageHeight;

      return aspectRatio;
    } else {
      return 1;
    }
  } else {
    return 1;
  }
});
