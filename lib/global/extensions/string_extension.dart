extension StringX on String {
  /// as snake_case getter that converts a string in the formt numberOfDependants to snake_case as number_of_dependants
  /// Coverts a string to snale case so that the API can use it
  String get inSnakeCase {
    // convert the string in format "firstName" to "first_name"
    final text =
        replaceAllMapped(RegExp(r'(?<=[a-z])[A-Z]'), (match) => '_${match.group(0)}').toLowerCase();
    // then convert the string in format "first name" to "first_name"
    final snakedText = text.replaceAll(RegExp(r'[\s-]'), '_');

    return snakedText;
  }

  String get asUserName {
    // Split the name into a list of words.
    List<String> words = split(' ');

    // Convert each word to lowercase.
    words = words.map((word) => word.toLowerCase()).toList();

    // Remove any punctuation from the words.
    words = words.map((word) => word.replaceAll(RegExp(r'[^\w\s]'), '')).toList();

    // Join the words back together as one string without anyspace between them
    String username = words.join('');

    return username;
  }
}
