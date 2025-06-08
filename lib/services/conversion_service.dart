import '../models/platform_fee.dart';
import '../constants/app_constants.dart';
import '../models/currency.dart';
import '../models/conversion_history.dart';

class ConversionService {
  ConversionResult calculateConversion({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
    required String platform,
    required double exchangeRate,
  }) {
    final platformFee = AppConstants.platformFees.firstWhere(
      (fee) => fee.platform == platform,
      orElse: () => AppConstants.platformFees.first,
    );

    final feeAmount = (amount * platformFee.percentage / 100) + platformFee.fixedFee;
    final netAmount = amount - feeAmount;
    final finalAmount = netAmount * exchangeRate;

    return ConversionResult(
      originalAmount: amount,
      platformFee: feeAmount,
      netAmount: netAmount,
      finalAmount: finalAmount,
      currencyPair: CurrencyPair(
        from: Currency(
          code: fromCurrency,
          name: '',
          symbol: '',
          rate: 1.0,
        ),
        to: Currency(
          code: toCurrency,
          name: '',
          symbol: '',
          rate: exchangeRate,
        ),
        rate: exchangeRate,
      ),
      platform: platformFee,
      timestamp: DateTime.now(),
    );
  }
} 