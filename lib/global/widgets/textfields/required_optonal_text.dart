import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';

class RequiredOptionalText extends StatelessWidget {
  // add a hint text if that page is required or optional
  // the hint is a container with color naroRed for required, naroGreen for optional with a background opacit of 0.1 and text
  // that says required or optional
  const RequiredOptionalText({
    super.key,
    required this.isRequired,
    this.showText = true,
  });

  final bool isRequired;

  // whether to show text or not
  final bool showText;

  @override
  Widget build(BuildContext context) {
    // background Color
    final hintColor = (isRequired ? naroRed : naroGreen);

    // text
    final hintText = isRequired ? "Required" : "Optional";

    // icon
    final hintIcon =
        isRequired ? CupertinoIcons.asterisk_circle_fill : CupertinoIcons.checkmark_circle_fill;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacing8,
        vertical: spacing2,
      ),
      margin: const EdgeInsets.only(bottom: spacing8),
      decoration: BoxDecoration(
        color: hintColor.withOpacity(0.1),
        borderRadius: borderRadius40,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            hintIcon,
            color: hintColor,
            size: 10,
          ),
          if (showText) ...[
            const HorizontalSpace(of: spacing4),
            Text(
              hintText,
              style: TextStyle(
                color: hintColor,
                fontSize: fontSize8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
