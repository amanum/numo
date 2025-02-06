import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numo/bloc/wallet/wallet_bloc.dart';
import 'package:numo/data/repository/wallet_repository/wallet_repository.dart';
import 'package:numo/ui/screen/main/widget/numo_keyboard.dart';
import 'package:numo/ui/screen/main/widget/wallet_carousel.dart';
import 'package:numo/ui/widget/numo_scaffold.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WalletBloc(walletRepository: WalletRepository.createInstance())
            ..add(WalletEventGetWallets()),
      child: NumoScaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                child: WalletCarousel(),
              ),
              NumoKeyboard(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Income'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Transfer'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Expense'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
