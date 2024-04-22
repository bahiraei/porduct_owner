import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  final String amount;
  final String currencySymbol;
  final TextStyle integerStyle;
  final TextStyle decimalStyle;
  final TextStyle currencyStyle;

  const CurrencyWidget({
    super.key,
    required this.amount,
    required this.currencySymbol,
    required this.integerStyle,
    required this.decimalStyle,
    required this.currencyStyle,
  });

  @override
  Widget build(BuildContext context) {
    String formattedAmount = withCompactPriceSplit(
      amount: amount,
      separator: ',',
    );
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: formattedAmount,
            style: integerStyle,
          ),
          TextSpan(
            text: ' $currencySymbol',
            style: currencyStyle,
          ),
        ],
      ),
    );
  }

  String withCompactPriceSplit({
    required String amount,
    String separator = ",",
  }) {
    String str = "";
    String number = amount.toString();
    var numberSplit = number.split('.');
    number = numberSplit[0].replaceAll(separator, '');
    for (var i = number.length; i > 0;) {
      if (i > 3) {
        str = separator + number.substring(i - 3, i) + str;
      } else {
        str = number.substring(0, i) + str;
      }
      i = i - 3;
    }
    if (numberSplit.length > 1) {
      str += '.${numberSplit[1]}';
    }
    return str;
  }
}
