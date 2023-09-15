// flash
import 'package:flash/flash.dart';

import '../../naro_exporter.dart';

void showToast({
  required BuildContext context,
  required String text,
  String? message,
  Color backgroundColor = naroGreen,
  Color textColor = naroWhite,
}) async {
  // has message
  final hasMessage = message != null && message.isNotEmpty;

  // show toast
  await showFlash(
    context: context,
    duration: twoSeconds,
    barrierDismissible: true,
    builder: (_, controller) {
      // toast
      return FlashBar(
        controller: controller,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize16,
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpace(of: hasMessage ? spacing8 : spacing0),
            if (hasMessage)
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize14,
                ),
              ),
          ],
        ),
        reverseAnimationCurve: Curves.bounceOut,
        insetAnimationCurve: Curves.easeIn,
        position: FlashPosition.bottom,
        useSafeArea: true,
        behavior: FlashBehavior.floating,
        shape: toastBorder,
        backgroundColor: backgroundColor,
        margin: toastMargin,
        padding: padding8,
      );
    },
  );
}

// showErrorToast is used to show error toast
Future showErrorToast({
  required BuildContext context,
  required String text,
  String? message,
}) async {
  return showToast(
    context: context,
    text: text,
    message: message,
    backgroundColor: naroRed,
    textColor: naroWhite,
  );
}
