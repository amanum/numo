import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

extension DecimalExtensions on Decimal {
  String toStringMoneyFormat({
    String? currencySymbol,
    int decimalPlaces = 2,
  }) {
    String pattern = "#,##0";
    if (decimalPlaces > 0) {
      pattern += ".${'0' * decimalPlaces}";
    }
    final formatter = NumberFormat(pattern, "ru_RU");
    String result = formatter.format(toDouble());

    if (currencySymbol != null) {
      result = '$currencySymbol $result';
    }
    return result;
  }
}
