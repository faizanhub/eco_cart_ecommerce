import 'package:eco_cart_ecommerce/constants/app_strings.dart';

String? validateEmailField(String? email) {
  if (email == null || email.isEmpty || !email.contains('@')) {
    return AppStrings.enterValidEmail;
  }
  return null;
}

String? validatePasswordField(String? password) {
  if (password == null || password.isEmpty || password.length < 6) {
    return AppStrings.enterValidPassword;
  }
  return null;
}

String? validatePhoneField(String? phone) {
  if (phone == null || phone.isEmpty) {
    return AppStrings.phoneIsRequired;
  }
  return null;
}

String? validateNormalField(String? text) {
  if (text == null || text.isEmpty) {
    return AppStrings.fieldCannotBeEmpty;
  }
  return null;
}
