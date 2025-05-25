import 'dart:convert';

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

String userModelToJson(UserModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserModel {
  final User user;
  final String token;

  UserModel({
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };

  UserModel copyWith({
    User? user,
    String? token,
  }) {
    return UserModel(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          token == other.token;

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}

class User {
  final String name;
  final String email;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int id;

  User({
    required this.name,
    required this.email,
    this.updatedAt,
    this.createdAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };

  User copyWith({
    String? name,
    String? email,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt &&
          id == other.id;

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
