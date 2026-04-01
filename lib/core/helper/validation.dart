import 'package:easy_localization/easy_localization.dart';
import 'package:form_validator/form_validator.dart';

class Validation {
  static String? Function(String?) emailValidator() {
    return ValidationBuilder()
        .required("This field is required".tr())
        .email("Invalid email address".tr())
        .build();
  }

  static String? Function(String?) newPasswordValidator() {
    return ValidationBuilder(optional: false)
        .minLength(6, "Password must be at least 6 characters".tr())
        .maxLength(20, "Password must be at most 20 characters".tr())
        .regExp(RegExp('[a-z]'), "Password must contain letters".tr())
        .regExp(RegExp('[0-9]'), "Password must contain numbers".tr())
        .regExp(
          RegExp('[!@#&*~]'),
          "Password must contain special characters".tr(),
        )
        .required("This field is required".tr())
        .build();
  }

  static String? Function(String?) passwordValidator() {
    return ValidationBuilder(optional: false)
        .minLength(6, "Password must be at least 6 characters".tr())
        .maxLength(20, "Password must be at most 20 characters".tr())
        .required("This field is required".tr())
        .build();
  }

  static String? Function(String?) confirmPasswordValidator(
    var passwordController,
  ) {
    return ValidationBuilder(optional: false).add((value) {
      if (value != passwordController.text) {
        return "Passwords do not match".tr();
      } else {
        return null;
      }
    }).build();
  }

  static String? Function(String?) fullNameValidator() {
    return ValidationBuilder()
        .required("This field is required".tr())
        .minLength(3, "Name must be at least 3 characters".tr())
        .build();
  }

  static String? Function(String?) addressValidator() {
    return ValidationBuilder()
        .required("This field is required".tr())
        .minLength(5, "Address must be at least 5 characters".tr())
        .build();
  }

  static String? Function(String?) phoneValidator() {
    return ValidationBuilder()
        .required("This field is required".tr())
        .phone("Invalid phone number".tr())
        .build();
  }
}

