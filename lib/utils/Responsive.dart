import 'package:flutter/material.dart';

class Responsive {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double dynamicWidth(BuildContext context, double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  static double dynamicHeight(BuildContext context, double factor) {
    return MediaQuery.of(context).size.height * factor;
  }
}
