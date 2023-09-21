extension StringX on String {
  /// as snake_case getter that converts a string in the formt numberOfDependants to snake_case as number_of_dependants
  /// Coverts a string to snale case so that the API can use it
  String get inSnakeCase =>
      replaceAllMapped(RegExp(r'(?<=[a-z])[A-Z]'), (match) => '_${match.group(0)}').toLowerCase();
}
