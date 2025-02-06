import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numo/bloc/wallet/wallet_bloc.dart';
import 'package:numo/data/entity/wallet.dart';
import 'package:numo/data/extensions/decimal_extensions.dart';
import 'package:numo/ui/common/numo_card.dart';

class WalletCarousel extends StatelessWidget {
  const WalletCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        List<Widget> slides = [];
        switch (state) {
          case WalletStateLoading():
            slides = [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ];
            break;
          case WalletStateActive(wallets: List<Wallet> wallets):
            slides = wallets
                .map((w) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: NumoCard(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                w.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                w.balance.toStringMoneyFormat(
                                    currencySymbol: w.currency.symbol),
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList();
            break;
        }
        return CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: double.infinity,
            enableInfiniteScroll: false,
          ),
          carouselController: CarouselSliderController(),
          items: slides,
        );
      },
    );
  }
}
