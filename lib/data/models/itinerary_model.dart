class ItineraryModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final bool isPublic;
  final bool status;

  ItineraryModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.isPublic,
    required this.status,
  });

  factory ItineraryModel.fromJson(Map<String, dynamic> json) => ItineraryModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        isPublic: json["isPublic"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
        "isPublic": isPublic,
        "status": status,
      };
}
