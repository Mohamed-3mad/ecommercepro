class TFirebaseExceptions implements Exception {
  final String code;

  TFirebaseExceptions(this.code);

  //Get the corresponding error message based on the error code

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occured. Please try again';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again';
      case 'weak-password':
        return 'The password. Please is too weak. Please choose a stronger password.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'invalid verification ID. Please request a new verification code';
      case 'quote-exceeded':
        return 'Quote exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address is already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'The account address is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already in associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'ivalid-action-code':
        return 'The action code is invalid. Please check the code and try again';
      case 'missing-action-code':
        return 'The action code is missing. Please provid a valid action code';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'keychain-error':
        return 'A keychain error occured. Please check the keychain and try again';
      default:
        return 'A Firebase error occurred. Please try again.';
    }
  }
}
