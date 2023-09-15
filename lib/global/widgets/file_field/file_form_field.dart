import '../../../naro_exporter.dart';
import '../textfields/field_label.dart';
import 'pick_artwork.dart';
import 'preview_file.dart';
import 'providers.dart';

class FileFormField extends ConsumerWidget {
  const FileFormField({
    super.key,
    required this.formField,
  });
// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // is file picked
    final isFilePicked = ref.watch(isReceiptPickedProvider);
    return SizedBox(
      // height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // label
          FormLabel(
            form: formField,
            labelText: formField.label,
          ),
          const VerticalSpace(of: spacing4),

          // form file field
          isFilePicked ? const PreviewFile() : const PickArtwork(),
        ],
      ),
    );
  }
}
