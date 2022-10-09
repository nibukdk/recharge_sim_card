import 'package:card_scanner/card_scanner.dart';

class CardScannerProvider {
  int? _cardNumber;

  get cardNumber => _cardNumber;

  Future<int> getCardNumber() async {
    CardDetails? cardDetails = await CardScanner.scanCard();
    int cardNumber = 0;
    if (cardDetails != null) {
      cardNumber = cardDetails.cardNumber as int;
    }
    return cardNumber;
  }
}
