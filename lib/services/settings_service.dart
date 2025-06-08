import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _themeKey = 'theme_mode';
  static const String _defaultCurrencyKey = 'default_currency';
  static const String _defaultPlatformKey = 'default_platform';
  static const String _showTipsKey = 'show_tips';
  static const String _autoSaveKey = 'auto_save';

  final SharedPreferences _prefs;

  SettingsService(this._prefs);

  // Theme Mode
  String get themeMode => _prefs.getString(_themeKey) ?? 'system';
  Future<void> setThemeMode(String mode) => _prefs.setString(_themeKey, mode);

  // Default Currency
  String get defaultCurrency => _prefs.getString(_defaultCurrencyKey) ?? 'PKR';
  Future<void> setDefaultCurrency(String currency) => _prefs.setString(_defaultCurrencyKey, currency);

  // Default Platform
  String get defaultPlatform => _prefs.getString(_defaultPlatformKey) ?? 'PayPal';
  Future<void> setDefaultPlatform(String platform) => _prefs.setString(_defaultPlatformKey, platform);

  // Show Tips
  bool get showTips => _prefs.getBool(_showTipsKey) ?? true;
  Future<void> setShowTips(bool value) => _prefs.setBool(_showTipsKey, value);

  // Auto Save
  bool get autoSave => _prefs.getBool(_autoSaveKey) ?? true;
  Future<void> setAutoSave(bool value) => _prefs.setBool(_autoSaveKey, value);

  // Reset Settings
  Future<void> resetSettings() async {
    await _prefs.remove(_themeKey);
    await _prefs.remove(_defaultCurrencyKey);
    await _prefs.remove(_defaultPlatformKey);
    await _prefs.remove(_showTipsKey);
    await _prefs.remove(_autoSaveKey);
  }
} 