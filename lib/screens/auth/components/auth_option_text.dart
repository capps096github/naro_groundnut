import '../../../naro_exporter.dart';
import '../auth_page.dart';

class AuthOptionText extends ConsumerWidget {
  const AuthOptionText({
    super.key,
    this.question,
  });

  // nullable question
  final String? question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // aceess the auth page
    final authpage = ref.watch(authPageProvider);

    return Align(
      alignment: Alignment.center,
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
            //  go to forgot password page index
            ref.read(authPageIndexProvider.notifier).state = authpage.actionPageIndex;
          },
          borderRadius: BorderRadius.circular(8),
          hoverColor: naroColor.withOpacity(.05),
          splashColor: naroColor.withOpacity(.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: question ?? authpage.question,
                style: GoogleFonts.poppins(
                  fontSize: fontSize14,
                  color: naroBlack,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "  ${authpage.action?.toUpperCase()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: naroColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
