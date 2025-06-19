class AuthResponseEntity {
  final String? statusMsg;
  final String? message;
  final User? user;
  final String? token;

  AuthResponseEntity({
    required this.statusMsg,
    required this.message,
    required this.user,
    required this.token,
  });
}

class User {
  final String name;
  final String email;
  final String role;

  User({required this.name, required this.email, required this.role});
}
