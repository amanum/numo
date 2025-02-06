import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numo/data/extensions/decimal_extensions.dart';
import 'package:numo/ui/common/colors.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:numo/ui/style/numo_icons.dart';

const _point = ',';

class NumoKeyboard extends StatefulWidget {
  const NumoKeyboard({
    super.key,
  });

  @override
  State<NumoKeyboard> createState() => _NumoKeyboardState();
}

class _NumoKeyboardState extends State<NumoKeyboard> {
  String input = "0";

  void _onDeleteTap() {
    setState(() {
      if (input.length > 1) {
        final str = input.substring(0, input.length - 1);
        final parts = str.split(_point);
        String result = _getFormattedAmount(parts[0]);
        if (parts.length == 2) {
          result += '$_point${parts[1]}';
        }
        input = result;
      } else {
        input = "0";
      }
    });
  }

  void _onPointTap() {
    setState(() {
      if (!input.contains(_point)) {
        input += _point;
      }
    });
  }

  void _onDigitTap(int digit) {
    setState(() {
      if (input == "0") {
        input = digit.toString();
      } else {
        if (input.contains(_point)) {
          List<String> parts = input.split(_point);
          if (parts.length == 2 && parts[1].length >= 2) {
            return;
          }
          input += digit.toString();
        } else if (input.length > 10) {
          return;
        } else {
          input = _getFormattedAmount('$input$digit');
        }
      }
    });
  }

  String _getFormattedAmount(String amount) {
    final str = amount.replaceAll(RegExp(r'\s+'), '');
    final amountDecimal = Decimal.parse(str);
    return amountDecimal.toStringMoneyFormat(decimalPlaces: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AmountField(input),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DigitBtn(1, _onDigitTap),
            _DigitBtn(2, _onDigitTap),
            _DigitBtn(3, _onDigitTap),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DigitBtn(4, _onDigitTap),
            _DigitBtn(5, _onDigitTap),
            _DigitBtn(6, _onDigitTap),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DigitBtn(7, _onDigitTap),
            _DigitBtn(8, _onDigitTap),
            _DigitBtn(9, _onDigitTap),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TextBtn(
              text: _point,
              onTap: _onPointTap,
            ),
            _DigitBtn(0, _onDigitTap),
            _DeleteBtn(_onDeleteTap),
          ],
        ),
      ],
    );
  }
}

class _AmountField extends StatelessWidget {
  const _AmountField(this.amount);

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: NumoColors.btnBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              offset: Offset(2, 2),
              blurRadius: 4,
              spreadRadius: 1,
              inset: true,
            ),
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              offset: Offset(-2, -2),
              blurRadius: 4,
              spreadRadius: 1,
              inset: true,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                amount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DigitBtn extends StatelessWidget {
  const _DigitBtn(this.digit, this.onTap);

  final int digit;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return _TextBtn(
      text: digit.toString(),
      onTap: () => onTap(digit),
    );
  }
}

class _TextBtn extends StatelessWidget {
  const _TextBtn({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _Btn(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DeleteBtn extends StatelessWidget {
  const _DeleteBtn(this.onTap);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _Btn(
      onTap: onTap,
      child: SvgPicture.asset(
        NumoIcons.keyboardDelete,
        width: 28,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class _Btn extends StatefulWidget {
  const _Btn({
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  State<_Btn> createState() => _BtnState();
}

class _BtnState extends State<_Btn> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        width: 60,
        height: 60,
        duration: Duration(milliseconds: 50),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: NumoColors.btnBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPressed ? NumoColors.btnBorder : Colors.transparent,
          ),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 1,
                    inset: true,
                  ),
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                    spreadRadius: 1,
                    inset: true,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: Offset(3, 3),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    offset: Offset(-3, -3),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
