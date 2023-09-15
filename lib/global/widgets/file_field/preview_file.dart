import 'dart:io';

import '../../../naro_exporter.dart';
import 'providers.dart';

class PreviewFile extends ConsumerWidget {
  const PreviewFile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get the image file from the provider
    final pickedImageFile = ref.watch(pickedImageFileProvider);

    // aspect ratio
    final aspectRatio = ref.watch(aspectRatioProvider);

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: naroColor,
            width: 1,
          ),
          borderRadius: borderRadius8,
        ),
        constraints: const BoxConstraints(maxHeight: 200),
        child: ClipRRect(
          borderRadius: borderRadius8,
          clipBehavior: Clip.antiAlias,
          child: (pickedImageFile != null)
              ? Stack(
                  children: [
                    Image.file(
                      File(pickedImageFile.path),
                      fit: BoxFit.cover,
                    ),

                    // reset icon button in a circle avatar
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: naroColor.withOpacity(.8),
                          borderRadius: borderRadius4,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: naroWhite,
                          ),
                          onPressed: () {
                            ref.read(pickedImageFileProvider.notifier).state = null;
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : const EmptySpace(),
        ),
      ),
    );
  }
}
