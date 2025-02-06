import 'package:decimal/decimal.dart';
import 'package:uuid/uuid.dart';

enum WalletCurrency {
  kzt("₸"),
  rub("₽"),
  usd("\$"),
  eur("€");

  final String symbol;
  const WalletCurrency(this.symbol);
}

class Wallet {
  final String _id;
  final String name;
  final Decimal balance;
  final String iconName;
  final DateTime createdAt;
  final WalletCurrency currency;

  String get id => _id;

  Wallet({
    required this.name,
    this.iconName = '',
    String? id,
    Decimal? balance,
    DateTime? createdAt,
    this.currency = WalletCurrency.kzt,
  })  : _id = id ?? Uuid().v4(),
        balance = balance ?? Decimal.zero,
        createdAt = DateTime.now();

  Wallet copyWith({
    String? name,
    Decimal? balance,
    String? iconName,
    WalletCurrency? currency,
  }) {
    return Wallet(
      id: id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      iconName: iconName ?? this.iconName,
      createdAt: createdAt,
      currency: currency ?? this.currency,
    );
  }
}
