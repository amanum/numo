part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();
}

final class WalletStateLoading extends WalletState {
  @override
  List<Object> get props => [];
}

final class WalletStateActive extends WalletState {
  const WalletStateActive({required this.wallets});

  final List<Wallet> wallets;
  @override
  List<Object> get props => [wallets];
}
