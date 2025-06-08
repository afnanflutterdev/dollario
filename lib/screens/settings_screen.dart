import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/settings_service.dart';
import '../constants/app_constants.dart';
import '../widgets/responsive_layout.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, AsyncValue<SettingsService>>((ref) {
  return SettingsNotifier();
});

class SettingsNotifier extends StateNotifier<AsyncValue<SettingsService>> {
  SettingsNotifier() : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = AsyncValue.data(SettingsService(prefs));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> setThemeMode(String mode) async {
    state.whenData((settings) => settings.setThemeMode(mode));
  }

  Future<void> setDefaultCurrency(String currency) async {
    state.whenData((settings) => settings.setDefaultCurrency(currency));
  }

  Future<void> setDefaultPlatform(String platform) async {
    state.whenData((settings) => settings.setDefaultPlatform(platform));
  }

  Future<void> setShowTips(bool value) async {
    state.whenData((settings) => settings.setShowTips(value));
  }

  Future<void> setAutoSave(bool value) async {
    state.whenData((settings) => settings.setAutoSave(value));
  }

  Future<void> resetSettings() async {
    state.whenData((settings) => settings.resetSettings());
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF121212),
            const Color(0xFF1E1E2F),
            const Color(0xFF1E1E2F).withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00897B), Color(0xFF00FFFF)],
            ).createShader(bounds),
            child: Text(
              'Settings',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ResponsiveLayout(
          mobile: _buildContent(context, ref, settingsAsync),
          tablet: Center(
            child: SizedBox(
              width: 600,
              child: _buildContent(context, ref, settingsAsync),
            ),
          ),
          desktop: Center(
            child: SizedBox(
              width: 800,
              child: _buildContent(context, ref, settingsAsync),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, AsyncValue<SettingsService> settingsAsync) {
    return settingsAsync.when(
      data: (settings) => ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _SettingsCard(
            title: 'Theme',
            child: DropdownButtonFormField<String>(
              value: settings.themeMode,
              dropdownColor: const Color(0xFF1E1E2F),
              style: GoogleFonts.inter(color: const Color(0xFFECEFF1)),
              decoration: InputDecoration(
                labelText: 'Theme Mode',
                prefixIcon: const Icon(Icons.dark_mode, color: Color(0xFF00FFFF)),
              ),
              items: [
                DropdownMenuItem(value: 'system', child: Text('System', style: GoogleFonts.inter())),
                DropdownMenuItem(value: 'light', child: Text('Light', style: GoogleFonts.inter())),
                DropdownMenuItem(value: 'dark', child: Text('Dark', style: GoogleFonts.inter())),
              ],
              onChanged: (value) => ref.read(settingsProvider.notifier).setThemeMode(value!),
            ),
          ),
          const SizedBox(height: 20),
          _SettingsCard(
            title: 'Default Currency',
            child: DropdownButtonFormField<String>(
              value: settings.defaultCurrency,
              dropdownColor: const Color(0xFF1E1E2F),
              style: GoogleFonts.inter(color: const Color(0xFFECEFF1)),
              decoration: InputDecoration(
                labelText: 'Currency',
                prefixIcon: const Icon(Icons.attach_money_rounded, color: Color(0xFF00FFFF)),
              ),
              items: AppConstants.supportedCurrencies
                  .map((code) => DropdownMenuItem(
                        value: code,
                        child: Text('${AppConstants.currencyNames[code]} ($code)', style: GoogleFonts.inter()),
                      ))
                  .toList(),
              onChanged: (value) => ref.read(settingsProvider.notifier).setDefaultCurrency(value!),
            ),
          ),
          const SizedBox(height: 20),
          _SettingsCard(
            title: 'Default Platform',
            child: DropdownButtonFormField<String>(
              value: settings.defaultPlatform,
              dropdownColor: const Color(0xFF1E1E2F),
              style: GoogleFonts.inter(color: const Color(0xFFECEFF1)),
              decoration: InputDecoration(
                labelText: 'Platform',
                prefixIcon: const Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF00FFFF)),
              ),
              items: AppConstants.platformFees
                  .map((fee) => DropdownMenuItem(
                        value: fee.platform,
                        child: Text(fee.platform, style: GoogleFonts.inter()),
                      ))
                  .toList(),
              onChanged: (value) => ref.read(settingsProvider.notifier).setDefaultPlatform(value!),
            ),
          ),
          const SizedBox(height: 20),
          _SettingsCard(
            title: 'Show Tips',
            child: SwitchListTile(
              value: settings.showTips,
              onChanged: (value) => ref.read(settingsProvider.notifier).setShowTips(value),
              title: Text('Show tips on home screen', style: GoogleFonts.inter(color: const Color(0xFFECEFF1))),
              activeColor: const Color(0xFF00897B),
              inactiveThumbColor: const Color(0xFFB0BEC5),
              inactiveTrackColor: const Color(0xFF1E1E2F),
            ),
          ),
          const SizedBox(height: 20),
          _SettingsCard(
            title: 'Auto Save',
            child: SwitchListTile(
              value: settings.autoSave,
              onChanged: (value) => ref.read(settingsProvider.notifier).setAutoSave(value),
              title: Text('Auto save conversions to history', style: GoogleFonts.inter(color: const Color(0xFFECEFF1))),
              activeColor: const Color(0xFF00897B),
              inactiveThumbColor: const Color(0xFFB0BEC5),
              inactiveTrackColor: const Color(0xFF1E1E2F),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5252),
              foregroundColor: const Color(0xFFECEFF1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            icon: const Icon(Icons.restore),
            label: const Text('Reset Settings'),
            onPressed: () => _showResetDialog(context, ref),
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error', style: GoogleFonts.inter(color: Color(0xFFFF5252)))),
    );
  }

  Future<void> _showResetDialog(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E2F),
        title: Text('Reset Settings', style: GoogleFonts.inter(color: const Color(0xFFECEFF1))),
        content: Text('Are you sure you want to reset all settings?', style: GoogleFonts.inter(color: const Color(0xFFB0BEC5))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: GoogleFonts.inter(color: const Color(0xFFB0BEC5))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Reset', style: GoogleFonts.inter(color: const Color(0xFFFF5252))),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      ref.read(settingsProvider.notifier).resetSettings();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Settings reset', style: GoogleFonts.inter(color: const Color(0xFFECEFF1)))),
      );
    }
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _SettingsCard({required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00897B).withOpacity(0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00897B), Color(0xFF00FFFF)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.settings, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFECEFF1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
} 
