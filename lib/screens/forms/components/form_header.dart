import '../../../naro_exporter.dart';
import 'card_gradient.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.form,
  });

  final AppForm form;

  // form title function
  // this gets the  form.title and removes the word form which is at the end of the title
  String get formTitle => form.title.replaceAll("Form", "");

  @override
  Widget build(BuildContext context) {
    const formColor = naroColor;

    // text color
    final textColor = (formColor == naroWhite) ? naroBlack : naroWhite;

    const gradientColor = naroColor;

    //
    final headerImage = form.thumbnail;

    //
    return SliverAppBar(
      pinned: true,
      stretch: true,
      backgroundColor: formColor,
      expandedHeight: 200.0,
      collapsedHeight: 100.0,
      centerTitle: true,
      title: const NaroLogo(
        logoSize: appBarLogoSize,
        isGreen: false,
      ),
      leading: Padding(
        padding: padding4,
        child: Container(
          decoration: BoxDecoration(
            color: formColor.withOpacity(.3),
            borderRadius: borderRadius4,
          ),
          child: BackButton(color: textColor),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        titlePadding: padding8,
        title: Text(
          formTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: textColor,
            fontSize: fontSize20,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(imageUrl: headerImage),
            const CardGradient(gradientColor: gradientColor, borderRadius: borderRadius0),
          ],
        ),
      ),
    );
  }
}
