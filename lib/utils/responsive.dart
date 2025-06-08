import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getSafeAreaTop(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double getSafeAreaBottom(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double getSafeAreaLeft(BuildContext context) =>
      MediaQuery.of(context).padding.left;

  static double getSafeAreaRight(BuildContext context) =>
      MediaQuery.of(context).padding.right;

  static EdgeInsets getSafeAreaPadding(BuildContext context) =>
      MediaQuery.of(context).padding;

  static double getAdaptiveWidth(BuildContext context, double percentage) =>
      getWidth(context) * (percentage / 100);

  static double getAdaptiveHeight(BuildContext context, double percentage) =>
      getHeight(context) * (percentage / 100);

  static double getAdaptiveFontSize(BuildContext context, double baseSize) {
    final width = getWidth(context);
    if (width < 600) {
      return baseSize * 0.8;
    } else if (width < 1200) {
      return baseSize * 0.9;
    } else {
      return baseSize;
    }
  }

  static EdgeInsets getAdaptivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16.0);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24.0);
    } else {
      return const EdgeInsets.all(32.0);
    }
  }

  static double getAdaptiveSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 8.0;
    } else if (isTablet(context)) {
      return 16.0;
    } else {
      return 24.0;
    }
  }
} 