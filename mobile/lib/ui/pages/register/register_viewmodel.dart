import 'package:flutter/foundation.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/models/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  final UserRepository _userRepository = UserRepository();

  Future<UserModel?> register({
    required String name,
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.isEmpty ||
        email.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      error = "Semua field harus diisi";
      notifyListeners();
      return null;
    }
    if (password != confirmPassword) {
      error = "Password dan konfirmasi tidak sama";
      notifyListeners();
      return null;
    }
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final user = await _userRepository.register(
        name: name,
        email: email,
        username: username,
        password: password,
      );
      isLoading = false;
      notifyListeners();
      if (user != null) {
        return user;
      } else {
        error = "Register gagal";
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
