import 'package:flutter/cupertino.dart';

import '../../../naro_exporter.dart';
import '../about_item.dart';

class AboutTile extends StatelessWidget {
  const AboutTile({
    super.key,
    required this.aboutItem,
    this.tileColor = naroTransparent,
    this.textColor = naroBlack,
  });

  final AboutItem aboutItem;

  final Color tileColor, textColor;

  @override
  Widget build(BuildContext context) {
// tooltip
    final tooltip = aboutItem.tooltip;

    // on tap
    final onTap = aboutItem.onTap;

    // icon
    final icon = aboutItem.icon;

    // label
    final label = aboutItem.label;

    final goTo = aboutItem.goTo;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Tooltip(
        message: tooltip,
        textStyle: TextStyle(color: tileColor),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Material(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          color: tileColor,
          child: ListTile(
            tileColor: tileColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: textColor.withOpacity(.2)),
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: onTap ??
                () {
                  // go to this widget
                  if (goTo != null) {
                    push(goTo);
                  }
                },
            dense: true,
            leading: Icon(
              icon,
              color: textColor,
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: spacing4),
              child: Text(
                label,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: Icon(
              CupertinoIcons.chevron_forward,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
