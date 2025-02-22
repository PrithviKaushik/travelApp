//a model for the Explore Nearby Places feature with Places API
class Place {
  final String name;
  final String photoRef;
  //constructor
  Place({
    required this.name,
    required this.photoRef,
  });
  //factory constructor
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      photoRef: json['photos'][0]['photo_reference'],
    );
  }
}
