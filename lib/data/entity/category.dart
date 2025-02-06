import 'package:flutter/material.dart';
import 'package:numo/data/entity/transaction.dart';
import 'package:uuid/uuid.dart';

class Category {
  final String _id;
  final String name;
  final List<TransactionType> transactionTypes;
  final String iconName;
  final Color iconColor;

  String get id => _id;

  Category({
    required this.name,
    required this.transactionTypes,
    required this.iconName,
    String? id,
    this.iconColor = Colors.black,
  }) : _id = id ?? Uuid().v4();

  Category copyWith({
    String? name,
    List<TransactionType>? transactionTypes,
    String? iconName,
    Color? iconColor,
}) {
    return Category(
      name: name ?? this.name,
      transactionTypes: transactionTypes ?? this.transactionTypes,
      iconName: iconName ?? this.iconName,
      iconColor: iconColor ?? this.iconColor,
      id: _id,
    );
  }
}