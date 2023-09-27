class CategoriesApiReading {
  String? name;
  String? description;
  String? photoUrl;
  String? price;
  String? color;
  String? rating;
  int? reviews;
  List<String>? features;

  CategoriesApiReading({
    this.name,
    this.description,
    this.photoUrl,
    this.price,
    this.color,
    this.rating,
    this.reviews,
    this.features,
  });

  CategoriesApiReading.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    photoUrl = json['photoUrl'];
    price = json['price'];
    color = json['color'];
    rating = json['rating'];
    reviews = json['reviews'];
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
      'photoUrl': photoUrl,
      'price': price,
      'color': color,
      'rating': rating,
      'reviews': reviews,
      'features': features,
    };
    return data;
  }
}
