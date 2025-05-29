import 'package:get/get_utils/get_utils.dart';

// Validate for email
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!GetUtils.isEmail(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

// Validate for  password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return null;
}

// Validate for username
String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your username';
  }
  if (value.length < 3) {
    return 'Username must be at least 3 characters';
  }
  return null;
}

// Parse error messages from API response
String parseErrors(Map<String, dynamic>? errors) {
  if (errors == null) return "Unknown error occurred";
  return errors.entries
      .map(
        (entry) =>
            entry.value is List
                ? (entry.value as List).join(', ')
                : entry.value.toString(),
      )
      .join('\n');
}