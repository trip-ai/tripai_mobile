import 'package:tripai/data/enum/user_rule_type.dart';

class SignUpModel {
  final String token;
  final String providerId;
  final List<Role> roles;

  SignUpModel({
    required this.token,
    required this.providerId,
    required this.roles,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        token: json["token"],
        providerId: json["providerId"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "providerId": providerId,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };
}

class Role {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserRuleType name;

  Role({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: getUserRuleTypeByName(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": getNameByUserRuleType(name),
      };
}
