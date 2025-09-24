import 'package:flutter/foundation.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/models/user_model.dart';
import '../../../core/services/auth_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  UserModel? user;
  bool isLoading = false;
  String? error;
  final UserRepository _userRepository = UserRepository();
  final AuthViewModel? authViewModel;

  HomeViewModel({required this.authViewModel});

  Future<void> fetchProfile() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      user = await _userRepository.fetchProfile();
      if (user == null) {
        error = "Gagal mengambil profil";
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
  user = null;
  notifyListeners();
  authViewModel?.logout();
  }
}
