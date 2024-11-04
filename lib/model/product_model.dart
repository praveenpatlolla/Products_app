class Productdetails {
  Productdetails({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  Productdetails copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Productdetails(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  factory Productdetails.fromJson(Map<String, dynamic> json){
    return Productdetails(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toJson(),
  };

}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double? rate;
  final int? count;

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      rate: json["rate"],
      count: json["count"],
    );
  }

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };

}
