import '../../naro_exporter.dart';

class ProfileCardItem {
  // title
  final String title;

  // description
  final String description;

  // image path
  // final IconData icon;

  // thumbnail
  final String itemThumbnail;

  // user category, this can be farmer, seed producer, service provider
  // and is sent to the api as a query parameter
  final String category;

  final AppForm form;

  ProfileCardItem({
    required this.title,
    // required this.icon,
    required this.itemThumbnail,
    required this.description,
    required this.form,
    required this.category,
  });
}
