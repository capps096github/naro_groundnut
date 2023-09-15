import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

class TapToPickFile extends StatelessWidget {
  const TapToPickFile({super.key, required this.fromCamera, required this.fromGallery});

  // void call back fromCamera, fromGallery
  final VoidCallback fromCamera, fromGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace(of: spacing24),
          const Icon(
            CupertinoIcons.photo_fill_on_rectangle_fill,
            size: 120,
            color: naroColor,
          ),
          const Padding(
            padding: padding8,
            child: Text(
              'Select an option to Upload an reciept image',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: naroColor,
                fontSize: fontSize14,
              ),
            ),
          ),
          const VerticalSpace(of: spacing8),

          // a row with text buttons for the upload options
          // from camera or from gallery
          Wrap(
            spacing: spacing4,
            runSpacing: spacing4,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              AppTextButton(
                onTap: fromCamera,
                icon: CupertinoIcons.camera_fill,
                label: 'Upload from Camera',
                tooltipTextColor: naroWhite,
              ),
              AppTextButton(
                onTap: fromGallery,
                icon: CupertinoIcons.photo_fill,
                label: 'Upload from Gallery',
                tooltipTextColor: naroWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
