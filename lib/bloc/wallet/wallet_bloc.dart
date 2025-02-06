import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numo/data/entity/wallet.dart';
import 'package:numo/data/repository/wallet_repository/wallet_repository.dart';

part 'wallet_event.dart';

part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc({required WalletRepository walletRepository})
      : _walletRepository = walletRepository,
        super(WalletStateLoading()) {
    on<WalletEvent>((event, emit) => switch (event) {
          WalletEventGetWallets _ => _onGetWallets(event, emit),
          WalletEventCreateWallet() => _onCreateWallet(event, emit),
          WalletEventDeleteWallet() => _onDeleteWallet(event, emit),
          WalletEventUpdateWallet() => _onUpdateWallet(event, emit),
        });
  }

  final WalletRepository _walletRepository;

  Future<void> _onGetWallets(
    WalletEventGetWallets event,
    Emitter<WalletState> emit,
  ) async {
    emit(WalletStateLoading());
    final wallets = await _walletRepository.getWallets();
    emit(WalletStateActive(wallets: wallets));
  }

  Future<void> _onCreateWallet(
    WalletEventCreateWallet event,
    Emitter<WalletState> emit,
  ) async {}

  Future<void> _onDeleteWallet(
    WalletEventDeleteWallet event,
    Emitter<WalletState> emit,
  ) async {}

  Future<void> _onUpdateWallet(
    WalletEventUpdateWallet event,
    Emitter<WalletState> emit,
  ) async {}
}
