import 'package:decimal/decimal.dart';
import 'package:numo/data/entity/wallet.dart';

part 'wallet_repository_impl.dart';

abstract interface class WalletRepository {
  factory WalletRepository.createInstance() => _WalletRepositoryImpl();

  Future<List<Wallet>> getWallets();

  Future<void> createWallet();

  Future<void> deleteWallet();

  Future<Wallet> updateWallet();
}