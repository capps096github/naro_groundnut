import 'package:flutter/cupertino.dart';

import '../../naro_exporter.dart';

class NaroPlaceholder extends StatelessWidget {
  ///This is a placeholder widget used to render blank sample screens in the app
  const NaroPlaceholder({super.key, required this.title});

  /// title text for the screen
  final String title;
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: naroRandomColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              CupertinoIcons.circle_grid_hex_fill,
              color: naroWhite,
              size: 80,
            ),
          ),

          const VerticalSpace(of: spacing16),

          // title
          Text(
            title + naroRandomColor.toString(),
            style: const TextStyle(color: naroWhite),
          ),
        ],
      ),
    );
  }
}
