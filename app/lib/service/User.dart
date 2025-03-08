class User {
  String? name;
  String? email;
  String? password;

  User({this.name, this.email, this.password});

  // Convert User to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // Convert Map to User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
