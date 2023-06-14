class Plant {
  String? id;
  String name;
  String image;
  String category;
  int favorite;

  static const colName = 'name';
  static const colImage = 'image';
  static const colCategory = 'category';
  static const collectionName = 'plants';
  static const colFavorite = 'favorite';

  Plant({
    required this.name,
    required this.image,
    required this.category,
    required this.favorite, 
    this.id,
  });

  Map<String, dynamic> toMap() {
    var mapData = <String, dynamic>{
      colName: name,
      colImage: image,
      colCategory: category,
      colFavorite: favorite
    };
    return mapData;
  }

  Map<String, dynamic> toJson() {
    var jsonData = <String, dynamic>{
      colName: name,
      colImage: image,
      colCategory: category,
      colFavorite: favorite
    };
    return jsonData;
  }
}
