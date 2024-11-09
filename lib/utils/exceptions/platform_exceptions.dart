class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double check your information.';
      case 'network_error':
        return 'Network error. Please check your internet connection.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password.';
      case 'invalid-phone-number':
        return 'Invalid phone number';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your firebase project.';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired. Please sign in again';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'internal-error':
        return 'Internal error. Please try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code.';
      case 'network-request-failed':
        return 'Network request faild. Please check your internet connection.';
      case 'device_not_supported':
        return 'This feature is not supported on your device.';
      default:
        return 'A platform error occurred. Please try again.';
    }
  }
}
