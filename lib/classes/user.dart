class User {
  String userID;
  String name;
  String email;
  String phone;
  String password;
  User(
      {required this.name,
      required this.userID,
      required this.email,
      required this.password,
      required this.phone,
     });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"],
        userID : json["user_id"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        );
  }
}
