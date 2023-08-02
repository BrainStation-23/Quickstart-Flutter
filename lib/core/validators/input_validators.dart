class InputValidators {
  static final _userNameRegX = RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$');

  static final _emailRegX = RegExp(
      r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))');

  // static final _phoneRegX = RegExp(r"^\+(?:\d\s?){6,14}\d$");

  static String? userName(String? value) {
    if (value!.isEmpty) return 'Field can\'t be empty';

    return !_userNameRegX.hasMatch(value)
        ? 'Username can only contain letters, numbers and underscore(_) and must be of length between 8-30 characters'
        : null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return 'Field can\'t be empty';

    return !_emailRegX.hasMatch(value) ? 'Invalid email' : null;
  }

  static String? phone(String? value) {
    if (value!.isEmpty) return 'Field can\'t be empty';

    return value.length != 11 ? 'Must be 11 digits long' : null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) return 'Field can\'t be empty';

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Check for at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value!.isEmpty) return 'Field can\'t be empty';

    return value != password ? 'Passwords don\'t match' : null;
  }

  static String? name(String? value) {
    return value!.isEmpty ? 'Field can\'t be empty' : null;
  }

  static String? otp(String? value) {
    if (value!.isEmpty) {
      return 'Field can\'t be empty';
    }

    if (value.length != 6) {
      return 'Must be 6 digits long';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Only digits are allowed';
    }

    return null;
  }
}
