import '../../naro_exporter.dart';

///* this provides the default theme for the app
final naroThemeProvider = Provider<ThemeData>((ref) {
  return NaroTheme.light;
});

class NaroTheme {
  static ThemeData get light {
    // text theme
    final TextTheme textTheme = ThemeData.light().textTheme;

    const textStyleFunction = GoogleFonts.lato;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: naroColor,

      //* -- Visual Density
      visualDensity: VisualDensity.adaptivePlatformDensity,

      //* -- Appbar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        // backgroundColor: naroColor,
        // TODO put app font here, default is Lato
        titleTextStyle: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: naroWhite,
        ),
      ),

      //* -- tooltip
      tooltipTheme: const TooltipThemeData(
        textStyle: TextStyle(color: naroColor),
        decoration: BoxDecoration(
          color: naroSecondaryColor,
          borderRadius: borderRadius4,
        ),
      ),

      //* -- text button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding16),
        ),
      ),

      //* Text Theme
      textTheme: TextTheme(
        displayLarge: textStyleFunction(textStyle: textTheme.displayLarge),
        displayMedium: textStyleFunction(textStyle: textTheme.displayMedium),
        displaySmall: textStyleFunction(textStyle: textTheme.displaySmall),
        headlineLarge: textStyleFunction(textStyle: textTheme.headlineLarge),
        headlineMedium: textStyleFunction(textStyle: textTheme.headlineMedium),
        headlineSmall: textStyleFunction(textStyle: textTheme.headlineSmall),
        titleLarge: textStyleFunction(textStyle: textTheme.titleLarge),
        titleMedium: textStyleFunction(textStyle: textTheme.titleMedium),
        titleSmall: textStyleFunction(textStyle: textTheme.titleSmall),
        bodyLarge: textStyleFunction(textStyle: textTheme.bodyLarge),
        bodyMedium: textStyleFunction(textStyle: textTheme.bodyMedium),
        bodySmall: textStyleFunction(textStyle: textTheme.bodySmall),
        labelLarge: textStyleFunction(textStyle: textTheme.labelLarge),
        labelMedium: textStyleFunction(textStyle: textTheme.labelMedium),
        labelSmall: textStyleFunction(textStyle: textTheme.labelSmall),
      ),
    );
  }
}
