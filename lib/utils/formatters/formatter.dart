import 'package:intl/intl.dart';

class TFormatter {
  static String formatData(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // إزالة أي حرف غير رقمي
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // استخراج كود الدولة والتأكد من أن الرقم يحتوي عليه
    String countryCode = '+${digitsOnly.substring(0, 2)}'; // هنا 20 لمصر
    digitsOnly = digitsOnly.substring(2);

    // إضافة كود الدولة إلى الرقم النهائي
    final formattedNumber = StringBuffer();
    formattedNumber.write('$countryCode ');

    // تنسيق الرقم المتبقي
    if (countryCode == '+20') {
      formattedNumber.write('(${digitsOnly.substring(0, 3)}) ');
      formattedNumber.write('${digitsOnly.substring(3, 7)} ');
      formattedNumber.write(digitsOnly.substring(7));
    } else {
      // تنسيق مختلف للأكواد الأخرى
      int i = 0;
      while (i < digitsOnly.length) {
        int groupLength = (i == 0 && countryCode == '+1') ? 3 : 2;
        int end = i + groupLength;
        formattedNumber.write(digitsOnly.substring(i, end));

        if (end < digitsOnly.length) {
          formattedNumber.write(' ');
        }
        i = end;
      }
    }

    return formattedNumber.toString();
  }
}
