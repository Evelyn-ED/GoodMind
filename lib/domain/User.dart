class User {
  late String username;
  late String email;
  late String password;

  User(
      this.username,
      this.email,
      this.password,
      );

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['email'] = email;
    json['password'] = password;
    return json;
  }
}