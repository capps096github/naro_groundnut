import 'package:flutter/cupertino.dart';

import '../../naro_exporter.dart';

class GardenTile extends StatelessWidget {
  const GardenTile({super.key, required this.garden});

  final Garden garden;

  @override
  Widget build(BuildContext context) {
    final gardenPic = garden.photo.isEmpty ? defaultProfilePic : garden.photo;
    return Container(
      padding: horizontalPadding8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            imageUrl: gardenPic,
            height: 60,
            width: 60,
            borderRadius: borderRadius6,
            fit: BoxFit.fill,
          ),
          const HorizontalSpace(of: spacing8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.titleMedium(
                  garden.name.toUpperCase(),
                  maxLines: 1,
                  fontWeight: 800,
                  color: naroBlack,
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpace(of: spacing4),
                Row(
                  children: [
                    FxText.bodyMedium(
                      fontSize: fontSize12,
                      'PANTING DATE: ',
                      color: naroBlack,
                    ),
                    Flexible(
                      child: FxText.bodyMedium(
                        fontSize: fontSize12,
                        UtilService.formatDate(garden.plantingDate),
                        color: naroGrey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FxText.bodyMedium(
                      'CROP: ',
                      fontSize: fontSize12,
                      color: naroBlack,
                    ),
                    FxText.bodyMedium(
                      garden.cropName.toUpperCase(),
                      fontSize: fontSize12,
                      color: naroGrey,
                    ),
                  ],
                ),
                const VerticalSpace(of: spacing4),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person,
                      size: 12,
                      color: naroGrey,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    FxText.bodySmall(
                      garden.name,
                      color: naroGrey,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
