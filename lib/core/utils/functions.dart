import 'app_strings.dart';

String currentPrice(int price, double discountPercentage) {
  String newPrice = (price - (price * discountPercentage ~/ 100)).toString();
  return "$newPrice ${AppStrings.egb}";
}
