import '../models/user_model.dart';
import '../../core/services/api_service.dart';
import '../../core/constants/api_endpoints.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  Future<UserModel?> login(String username, String password) async {
    final response = await _apiService.post(ApiEndpoints.login, {
      "username": username,
      "password": password,
    });
    if (response["success"] == true && response["user"] != null) {
      return UserModel.fromJson(response["user"]);
    }
    return null;
  }

  Future<UserModel?> register({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    final response = await _apiService.post(ApiEndpoints.register, {
      "name": name,
      "email": email,
      "username": username,
      "password": password,
    });
    if (response["success"] == true && response["user"] != null) {
      return UserModel.fromJson(response["user"]);
    }
    return null;
  }

  Future<UserModel?> fetchProfile() async {
    final response = await _apiService.get(ApiEndpoints.profile);
    if (response["success"] == true && response["user"] != null) {
      return UserModel.fromJson(response["user"]);
    }
    return null;
  }
}
