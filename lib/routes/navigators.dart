import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Navigation without named routes
/// To navigate to a new screen:
/// With option of back button working
void push(Widget widget) {
  Get.to(widget);
}

/// pop the current page on screen
void pop() {
  Get.back();
}

/// pop the current page on screen and open a new page
void popAndPush(Widget widget) {
  Get.off(widget);
}

/// pop all the pages on screen and open a new page
void popAllAndPush(Widget widget) {
  Get.offAll(widget);
}

//* Navigation with named routes

/// To navigate to a new screen:
/// With option of back button working
void pushNamed(String routeName) {
  Get.toNamed(routeName);
}

/// pop the current page on screen
void popNamed() {
  Get.back();
}

/// pop the current page on screen and open a new page
void popAndPushNamed(String routeName) {
  Get.offNamed(routeName);
}

/// pop all the pages on screen and open a new page
void popAllAndPushNamed(String routeName) {
  Get.offAllNamed(routeName);
}
