import 'package:form_validator/form_validator.dart';

class Validation {
  static String? Function(String?) emailValidator() {
    return ValidationBuilder()
        .required("This field is required")
        .email("Invalid email address")
        .build();
  }

  static String? Function(String?) newPasswordValidator() {
    return ValidationBuilder(optional: false)
        .minLength(6, "Password must be at least 6 characters")
        .maxLength(20, "Password must be at most 20 characters")
        .regExp(RegExp('[a-z]'), "Password must contain letters")
        .regExp(RegExp('[0-9]'), "Password must contain numbers")
        .regExp(RegExp('[!@#&*~]'), "Password must contain special characters")
        .required("This field is required")
        .build();
  }

  static String? Function(String?) passwordValidator() {
    return ValidationBuilder(optional: false)
        .minLength(6, "Password must be at least 6 characters")
        .maxLength(20, "Password must be at most 20 characters")
        .required("This field is required")
        .build();
  }

  static String? Function(String?) confirmPasswordValidator(
    var passwordController,
  ) {
    return ValidationBuilder(optional: false).add((value) {
      if (value != passwordController.text) {
        return "Passwords do not match";
      } else {
        return null;
      }
    }).build();
  }
}
