class User {
  late String username;
  late String password;
  late String email;
  User({required this.username, required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  bool exists(String _email) {
    return _email == _email;
  }

  bool login(String _email, String _password) {
    if (email == _email && password == _password) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'username':username,
      'email': email,
      'password': password,
    };
  }
}
