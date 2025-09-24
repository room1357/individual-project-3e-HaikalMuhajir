import 'package:flutter/foundation.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/models/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  final UserRepository _userRepository = UserRepository();

  Future<UserModel?> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      error = "Username dan password harus diisi";
      notifyListeners();
      return null;
    }
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final user = await _userRepository.login(username, password);
      isLoading = false;
      notifyListeners();
      if (user != null) {
        return user;
      } else {
        error = "Login gagal";
        return null;
      }
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
      return null;
    }
  }
}
