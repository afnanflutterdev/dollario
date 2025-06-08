import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformConfig {
  static bool get isWeb => kIsWeb;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isWindows => !kIsWeb && Platform.isWindows;
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
  static bool get isMobile => isAndroid || isIOS;
  static bool get isDesktop => isWindows || isMacOS || isLinux;

  static double get adaptiveIconSize {
    if (isMobile) {
      return 24.0;
    } else if (isTablet) {
      return 32.0;
    } else {
      return 40.0;
    }
  }

  static bool get isTablet {
    if (isWeb) {
      return false; // Handle web tablet detection separately
    }
    if (isAndroid) {
      return Platform.environment['ANDROID_DEVICE_TYPE'] == 'tablet';
    }
    if (isIOS) {
      // iOS tablet detection using PlatformDispatcher
      final window = WidgetsBinding.instance.platformDispatcher.views.first;
      return window.physicalSize.width / window.devicePixelRatio >= 600;
    }
    return false;
  }

  static EdgeInsets get safeAreaPadding {
    if (isMobile) {
      return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    } else if (isTablet) {
      return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
    } else {
      return const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0);
    }
  }

  static double adaptiveFontSize(double baseSize) {
    if (isMobile) {
      return baseSize * 0.8;
    } else if (isTablet) {
      return baseSize * 0.9;
    } else {
      return baseSize;
    }
  }

  static double get adaptiveSpacing {
    if (isMobile) {
      return 8.0;
    } else if (isTablet) {
      return 16.0;
    } else {
      return 24.0;
    }
  }

  static double get adaptiveButtonHeight {
    if (isMobile) {
      return 48.0;
    } else if (isTablet) {
      return 56.0;
    } else {
      return 64.0;
    }
  }

  static double get adaptiveInputHeight {
    if (isMobile) {
      return 40.0;
    } else if (isTablet) {
      return 48.0;
    } else {
      return 56.0;
    }
  }

  static double get adaptiveBorderRadius {
    if (isMobile) {
      return 8.0;
    } else if (isTablet) {
      return 12.0;
    } else {
      return 16.0;
    }
  }
} 