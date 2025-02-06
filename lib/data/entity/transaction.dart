import 'package:decimal/decimal.dart';
import 'package:uuid/uuid.dart';

enum TransactionType {
  income(1),
  expense(2);

  final int value;

  const TransactionType(this.value);
}

class Transaction {
  static const int income = 1;
  static const int expense = 2;

  final String _id;
  final Decimal amount;
  final String? comment;
  final String walletId;
  final DateTime createdAt;
  final TransactionType type;
  final int? transferId;

  String get id => _id;

  Transaction({
    required this.amount,
    required this.walletId,
    required this.type,
    String? id,
    DateTime? createdAt,
    this.comment,
    this.transferId,
  })  : _id = id ?? Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  Transaction copyWith({
    Decimal? amount,
    String? comment,
    String? walletId,
    TransactionType? type,
    int? transferId,
  }) {
    return Transaction(
      id: id,
      amount: amount ?? this.amount,
      comment: comment ?? this.comment,
      walletId: walletId ?? this.walletId,
      createdAt: createdAt,
      type: type ?? this.type,
      transferId: transferId ?? this.transferId,
    );
  }
}
