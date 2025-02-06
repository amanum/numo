part of 'wallet_repository.dart';

class _WalletRepositoryImpl implements WalletRepository {
  @override
  Future<List<Wallet>> getWallets() async {
    return wallets;
  }

  @override
  Future<void> createWallet() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWallet() {
    throw UnimplementedError();
  }

  @override
  Future<Wallet> updateWallet() {
    throw UnimplementedError();
  }
}

List<Wallet> wallets = [
  Wallet(
    name: 'Kaspi Gold',
    balance: Decimal.fromInt(2538400),
  ),
  Wallet(
    name: 'Депозит',
  ),
];
