class Validator {
  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your user name';
    }

    if (value.length < 3) {
      return 'User name must be at least 3 characters long';
    }

    final nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'User name should not contain special characters';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumbers = RegExp(r'[0-9]').hasMatch(value);

    if (!hasLetters || !hasNumbers) {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }
}
