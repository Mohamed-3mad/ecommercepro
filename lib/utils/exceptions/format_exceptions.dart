class TFormatExceptions implements Exception {
  final String message;

  const TFormatExceptions(
      [this.message =
          'An unexpected format error occured. Please check your input.']);

  factory TFormatExceptions.fromMessage(String message) {
    return TFormatExceptions(message);
  }

  String get formattedMessage => message;

  factory TFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatExceptions('The email address format is invalid');
      case 'invalid-phone-number-format':
        return const TFormatExceptions('The phone number format is invalid');
      case 'invalid-data-format':
        return const TFormatExceptions('The data format is invalid');
      case 'invalid-numeric-format':
        return const TFormatExceptions(
            'The input should be a valid numeric format.');
      case 'invalid-url-format':
        return const TFormatExceptions('The URL format is invalid');
      case 'invalid-credit-card-format':
        return const TFormatExceptions('The credit card format is invalid');
      default:
        return const TFormatExceptions('invalid data');
    }
  }
}
