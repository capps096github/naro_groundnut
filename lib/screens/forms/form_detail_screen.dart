import '../../naro_exporter.dart';
import 'components/detail_form.dart';
import 'components/detail_form_hints.dart';
import 'components/form_header.dart';
import 'components/section_title_text.dart';

class FormDetailScreen extends StatelessWidget {
  const FormDetailScreen({super.key, required this.form});

  final AppForm form;

  @override
  Widget build(BuildContext context) {
    final isFormAvailable = form.isActive;

    //
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Unfocus Keyboard
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: CustomScrollView(
          slivers: [
            FormHeader(form: form),

            // form
            SliverPadding(
              padding: padding16,
              sliver: SliverToBoxAdapter(
                child: SectionTitleText(
                  title: "Description:",
                  bodyText: form.description,
                ),
              ),
            ),
            const DetailFormHints(),
            const SliverVerticalSpace(of: spacing16),
            const SliverPadding(
              padding: horizontalPadding16,
              sliver: SliverToBoxAdapter(
                child: SectionTitleText(
                  title: "Here you go!",
                  bodyText: "Fill in the form below.",
                ),
              ),
            ),
            DetailForm(form: form),
          ],
        ),
      ),
      bottomNavigationBar: isFormAvailable
          ? Container(
              padding: padding8,
              color: naroWhite,
              child: SubmitFormButton(form: form),
            )
          : null,
    );
  }
}
