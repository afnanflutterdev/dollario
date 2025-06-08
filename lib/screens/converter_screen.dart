import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../models/platform_fee.dart';
import '../models/currency.dart';
import '../services/exchange_rate_service.dart';
import '../services/conversion_service.dart';
import '../widgets/responsive_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/history_service.dart';

final usdAmountProvider = StateProvider<String>((ref) => '');
final selectedPlatformProvider = StateProvider<String>((ref) => AppConstants.platformFees.first.platform);
final selectedCurrencyProvider = StateProvider<String>((ref) => AppConstants.supportedCurrencies.first);
final conversionResultProvider = StateProvider<ConversionResult?>((ref) => null);
final isLoadingProvider = StateProvider<bool>((ref) => false);

class ConverterScreen extends ConsumerWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usdAmount = ref.watch(usdAmountProvider);
    final selectedPlatform = ref.watch(selectedPlatformProvider);
    final selectedCurrency = ref.watch(selectedCurrencyProvider);
    final conversionResult = ref.watch(conversionResultProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0A0A0A),
            const Color(0xFF1A1A1A),
            const Color(0xFF2A2A2A).withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ResponsiveLayout(
          mobile: _buildContent(context, ref, usdAmount, selectedPlatform, selectedCurrency, conversionResult, isLoading),
          tablet: Center(
            child: SizedBox(
              width: 500,
              child: _buildContent(context, ref, usdAmount, selectedPlatform, selectedCurrency, conversionResult, isLoading),
            ),
          ),
          desktop: Center(
            child: SizedBox(
              width: 400,
              child: _buildContent(context, ref, usdAmount, selectedPlatform, selectedCurrency, conversionResult, isLoading),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context,
      WidgetRef ref,
      String usdAmount,
      String selectedPlatform,
      String selectedCurrency,
      ConversionResult? conversionResult,
      bool isLoading,
      ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            _buildHeader(context),
            const SizedBox(height: 40),

            // Input Fields
            _buildAnimatedInput(
              context,
              _buildStyledTextField(
                context,
                ref,
                'Enter USD Amount',
                Icons.attach_money_rounded,
                TextInputType.numberWithOptions(decimal: true),
                    (value) => ref.read(usdAmountProvider.notifier).state = value,
              ),
              0,
            ),
            const SizedBox(height: 20),

            _buildAnimatedInput(
              context,
              _buildStyledDropdown(
                context,
                'Select Platform',
                Icons.account_balance_wallet_rounded,
                selectedPlatform,
                AppConstants.platformFees
                    .map((fee) => DropdownMenuItem(
                  value: fee.platform,
                  child: Text(
                    fee.platform,
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ))
                    .toList(),
                    (value) => ref.read(selectedPlatformProvider.notifier).state = value!,
              ),
              1,
            ),
            const SizedBox(height: 20),

            _buildAnimatedInput(
              context,
              _buildStyledDropdown(
                context,
                'Select Local Currency',
                Icons.currency_exchange_rounded,
                selectedCurrency,
                AppConstants.supportedCurrencies
                    .map((code) => DropdownMenuItem(
                  value: code,
                  child: Text(
                    '${AppConstants.currencyNames[code]} ($code)',
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ))
                    .toList(),
                    (value) => ref.read(selectedCurrencyProvider.notifier).state = value!,
              ),
              2,
            ),
            const SizedBox(height: 32),

            // Convert Button
            _buildAnimatedButton(
              context,
              _buildGradientButton(
                context,
                ref,
                isLoading,
                usdAmount,
                selectedPlatform,
                selectedCurrency,
              ),
            ),
            const SizedBox(height: 32),

            // Results
            if (conversionResult != null)
              _buildAnimatedResult(context, conversionResult),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D4FF).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.currency_exchange_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
          ).createShader(bounds),
          child: Text(
            'Dollario',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.appTagline,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStyledTextField(
      BuildContext context,
      WidgetRef ref,
      String label,
      IconData icon,
      TextInputType keyboardType,
      Function(String) onChanged,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: TextField(
        keyboardType: keyboardType,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.7),
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildStyledDropdown<T>(
      BuildContext context,
      String label,
      IconData icon,
      T value,
      List<DropdownMenuItem<T>> items,
      Function(T?) onChanged,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        dropdownColor: const Color(0xFF1A1A1A),
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.7),
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildGradientButton(
      BuildContext context,
      WidgetRef ref,
      bool isLoading,
      String usdAmount,
      String selectedPlatform,
      String selectedCurrency,
      ) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D4FF).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
          FocusScope.of(context).unfocus();
          final amount = double.tryParse(ref.read(usdAmountProvider)) ?? 0.0;
          if (amount <= 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Enter a valid USD amount.',
                  style: GoogleFonts.inter(),
                ),
                backgroundColor: const Color(0xFFFF6B6B),
              ),
            );
            return;
          }
          ref.read(isLoadingProvider.notifier).state = true;
          try {
            final exchangeService = ExchangeRateService();
            final conversionService = ConversionService();
            final pair = await exchangeService.getCurrencyPair('USD', ref.read(selectedCurrencyProvider));
            final result = conversionService.calculateConversion(
              amount: amount,
              fromCurrency: 'USD',
              toCurrency: ref.read(selectedCurrencyProvider),
              platform: ref.read(selectedPlatformProvider),
              exchangeRate: pair.rate,
            );
            ref.read(conversionResultProvider.notifier).state = result;
            // Save to history
            final prefs = await SharedPreferences.getInstance();
            final historyService = HistoryService(prefs);
            await historyService.addToHistory(result);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error: $e',
                  style: GoogleFonts.inter(),
                ),
                backgroundColor: const Color(0xFFFF6B6B),
              ),
            );
          } finally {
            ref.read(isLoadingProvider.notifier).state = false;
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Text(
          'Convert',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedInput(BuildContext context, Widget child, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + (index * 100)),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildAnimatedButton(BuildContext context, Widget child) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildAnimatedResult(BuildContext context, ConversionResult result) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: _ResultBreakdown(result: result),
    );
  }
}

class _ResultBreakdown extends StatelessWidget {
  final ConversionResult result;
  const _ResultBreakdown({required this.result});

  @override
  Widget build(BuildContext context) {
    final format = (double v, String code) =>
    '${AppConstants.currencySymbols[code] ?? code}${v.toStringAsFixed(2)}';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.receipt_long_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Conversion Breakdown',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _ResultRow(
              label: 'Exchange Rate',
              value: '1 USD = ${result.currencyPair.rate.toStringAsFixed(2)} ${result.currencyPair.to.code}',
              icon: Icons.trending_up_rounded,
            ),
            const SizedBox(height: 12),
            _ResultRow(
              label: 'Platform Fee',
              value: '-${format(result.platformFee, result.currencyPair.from.code)}',
              icon: Icons.remove_circle_outline_rounded,
              isNegative: true,
            ),
            const SizedBox(height: 12),
            _ResultRow(
              label: 'Net USD',
              value: format(result.netAmount, result.currencyPair.from.code),
              icon: Icons.account_balance_wallet_rounded,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00D4FF), Color(0xFF6C5CE7)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _ResultRow(
                label: 'Final Local',
                value: format(result.finalAmount, result.currencyPair.to.code),
                icon: Icons.savings_rounded,
                isBold: true,
                isHighlighted: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isBold;
  final bool isHighlighted;
  final bool isNegative;

  const _ResultRow({
    required this.label,
    required this.value,
    required this.icon,
    this.isBold = false,
    this.isHighlighted = false,
    this.isNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isHighlighted
        ? Colors.white
        : isNegative
        ? const Color(0xFFFF6B6B)
        : Colors.white.withOpacity(0.9);

    return Row(
      children: [
        if (!isHighlighted) ...[
          Icon(
            icon,
            color: isNegative ? const Color(0xFFFF6B6B) : Colors.white.withOpacity(0.7),
            size: 20,
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: isBold ? 18 : 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
        if (isHighlighted) ...[
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isBold ? 18 : 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    );
  }
}