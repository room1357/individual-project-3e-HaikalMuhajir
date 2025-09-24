class UserModel {
  final String id;
  final String name;
  final String username;
  final String email;
  final String? profilePicture;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      profilePicture: json['profile_pic'],
    );
  }
}
