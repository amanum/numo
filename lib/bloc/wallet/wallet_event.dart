part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();
}

class WalletEventGetWallets extends WalletEvent {
  @override
  List<Object> get props => [];
}

class WalletEventCreateWallet extends WalletEvent {
  @override
  List<Object> get props => [];
}

class WalletEventDeleteWallet extends WalletEvent {
  @override
  List<Object> get props => [];
}

class WalletEventUpdateWallet extends WalletEvent {
  @override
  List<Object> get props => [];
}
