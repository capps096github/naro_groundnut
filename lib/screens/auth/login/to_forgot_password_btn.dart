// Project imports:
import '../../../naro_exporter.dart';

class ToForgotPasswordButton extends ConsumerWidget {
  const ToForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        borderRadius: borderRadius8,
        color: naroTransparent,
        child: InkWell(
          onTap: () {
            //* reset the error to an empty string
            ref.read(naroAPIErrorTextProvider.notifier).state = '';

            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            //  go to forgot password page index as per auth pages in auth_page.dart
            ref.read(authPageIndexProvider.notifier).state = 2;
          },
          borderRadius: BorderRadius.circular(8),
          hoverColor: naroColor.withOpacity(.05),
          splashColor: naroColor.withOpacity(.1),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: naroBlack,
                fontSize: fontSize14,
                height: 1.71,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
