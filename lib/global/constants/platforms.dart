import 'package:flutter/foundation.dart';

/// check if the current platform is Windows
final bool isNaroWindows = (defaultTargetPlatform == TargetPlatform.windows);

/// check if the current platform is Windows
final bool isNaroAndroid = (defaultTargetPlatform == TargetPlatform.android);

/// check if the current platform is Windows
final bool isNaroiOs = (defaultTargetPlatform == TargetPlatform.iOS);

/// check if the current platform is Windows or Web
const bool isNaroWeb = (kIsWeb);

/// check if the current platform is Windows or Web
final bool isNaroWebOrWindows = (isNaroWindows || isNaroWeb);

///This variable declares that if we are on phone
///, no mouse region, else we gat a mouse region
final isPhone = (isNaroAndroid || isNaroiOs);
