class FeedbackModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final int placeId;
  final int rating;
  final String comment;
  final List<String> images;

  FeedbackModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.placeId,
    required this.rating,
    required this.comment,
    required this.images,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        placeId: json["placeId"],
        rating: json["rating"],
        comment: json["comment"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
        "placeId": placeId,
        "rating": rating,
        "comment": comment,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
