class UserModel {
  String name;
  String email;
  String id;
  String phone;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.phone,
  });

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id, 'phone': phone};
  }
}
