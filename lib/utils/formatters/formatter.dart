import 'package:intl/intl.dart';

class AppFormatters{
    static String formatDate(DateTime? date) {
        date ??= DateTime.now();
        return  DateFormat('dd/MM/yyyy').format(date);
    }

    static String formatCurrency(double amount) {
        return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);

        
    }

    static String formatPhoneNumber(String phoneNumber , String countryCode){
         if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }

    if (phoneNumber.length == 10) {
      String part1 = phoneNumber.substring(0, 3);
      String part2 = phoneNumber.substring(3, 6);
      String part3 = phoneNumber.substring(6);
      return '+$countryCode $part1 $part2 $part3';
    } else if (phoneNumber.length == 11) {
      String part1 = phoneNumber.substring(0, 4);
      String part2 = phoneNumber.substring(4, 7);
      String part3 = phoneNumber.substring(7);
      return '+$countryCode $part1 $part2 $part3';
    }

    return '+$countryCode $phoneNumber';
    }
}