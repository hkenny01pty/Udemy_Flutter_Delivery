import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  String id;
  String email;
  String name;
  String lastname;
  String phone;
  String image;
  String password;

  User({
  required this.id,
  required this.email,
  required this.name,
  required this.lastname,
  required this.phone,
  required this.image,
  required this.password
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"].toString(),
    name: json["name"].toString(),
    lastname: json["lastname"].toString(),
    phone: json["phone"].toString(),
    image: json["image"].toString(),
    password: json["password"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "lastname": lastname,
    "phone": phone,
    "image": image,
    "password": password,
  };
}
