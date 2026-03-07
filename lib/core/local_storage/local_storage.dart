import 'package:craft_climb/core/utils/debug_console.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  static const String token = 'token';
  static const String userId = 'user_id';
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';
  static const String role = 'role';
  static const String onboardingCompleted = 'is_onboarding_completed';

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    DebugConsole.storage('SharedPreferences initialized');
  }

  /// Get SharedPreferences instance
  static Future<SharedPreferences> get _instance async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  /// Clear all data
  static Future<void> clearAll() async {
    final prefs = await _instance;
    await prefs.clear();
    DebugConsole.warning('All storage cleared');
  }

  // ═══════════════════════════════════════════════════════════════════════
  // SYNC GETTERS (for immediate access - no await needed)
  // ═══════════════════════════════════════════════════════════════════════

  /// Check if logged in
  static bool get isOnboardingCompleted =>
      _prefs?.getBool(onboardingCompleted) ?? false;

  // ═══════════════════════════════════════════════════════════════════════
  // Generic Methods
  // ═══════════════════════════════════════════════════════════════════════

  /// Set string value
  static Future<void> setString(String key, String value) async {
    final prefs = await _instance;
    await prefs.setString(key, value);
  }

  /// Get string value
  static Future<String> getString(
    String key, {
    String defaultValue = '',
  }) async {
    final prefs = await _instance;
    return prefs.getString(key) ?? defaultValue;
  }

  /// Set bool value
  static Future<void> setBool(String key, bool value) async {
    final prefs = await _instance;
    await prefs.setBool(key, value);
  }

  /// Get bool value
  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    final prefs = await _instance;
    return prefs.getBool(key) ?? defaultValue;
  }

  /// Set int value
  static Future<void> setInt(String key, int value) async {
    final prefs = await _instance;
    await prefs.setInt(key, value);
  }

  /// Get int value
  static Future<int> getInt(String key, {int defaultValue = 0}) async {
    final prefs = await _instance;
    return prefs.getInt(key) ?? defaultValue;
  }

  /// Remove key
  static Future<void> remove(String key) async {
    final prefs = await _instance;
    await prefs.remove(key);
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    final prefs = await _instance;
    return prefs.containsKey(key);
  }

  /// Set onboarding completed
  static Future<void> setOnboardingCompleted(bool value) async =>
      await setBool(onboardingCompleted, value);

  /// Get onboarding completed
  static Future<bool> getOnboardingCompleted() async =>
      await getBool(onboardingCompleted);

  ///Set role
  static Future<void> setRole(String value) async =>
      await setString(role, value);

  ///Get role
  static Future<String> getRole() async => await getString(role);
}
