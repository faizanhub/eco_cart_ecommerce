import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  bool isShowPassword = true;
  bool isLoading = false;

  toggleIsShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }
}
