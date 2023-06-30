class PlaceModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int categoryId;
  final String name;
  final String address;
  final String description;
  final List<String> images;
  final LocationModel location;
  final List<WorkdayModel> workdays;
  final bool status;
  final int rating;

  PlaceModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.name,
    required this.address,
    required this.description,
    required this.images,
    required this.location,
    required this.workdays,
    required this.status,
    required this.rating,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryId: json["categoryId"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        location: LocationModel.fromJson(json["location"]),
        workdays: List<WorkdayModel>.from(
            json["workdays"].map((x) => WorkdayModel.fromJson(x))),
        status: json["status"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categoryId": categoryId,
        "name": name,
        "address": address,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "location": location.toJson(),
        "workdays": List<dynamic>.from(workdays.map((x) => x.toJson())),
        "status": status,
        "rating": rating,
      };
}

class LocationModel {
  final int longitude;
  final int latitude;

  LocationModel({
    required this.longitude,
    required this.latitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}

class WorkdayModel {
  final int dayOfWeek;
  final From from;
  final From to;

  WorkdayModel({
    required this.dayOfWeek,
    required this.from,
    required this.to,
  });

  factory WorkdayModel.fromJson(Map<String, dynamic> json) => WorkdayModel(
        dayOfWeek: json["dayOfWeek"],
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "dayOfWeek": dayOfWeek,
        "from": from.toJson(),
        "to": to.toJson(),
      };
}

class From {
  final int hour;
  final int minute;
  final int second;
  final int nano;

  From({
    required this.hour,
    required this.minute,
    required this.second,
    required this.nano,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        hour: json["hour"],
        minute: json["minute"],
        second: json["second"],
        nano: json["nano"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "minute": minute,
        "second": second,
        "nano": nano,
      };
}
