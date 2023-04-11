class RootComposition {
  Composition composition;
  String created;

  RootComposition({required this.composition, required this.created});

  factory RootComposition.fromJson(Map<String, dynamic> json) {
    return RootComposition(
      composition: Composition.fromJson(json['composition']),
      created: json['created'],
    );
  }
}

class Composition {
  Slots slots;

  Composition({required this.slots});

  factory Composition.fromJson(Map<String, dynamic> json) {
    return Composition(
      slots: Slots.fromJson(json['slots']),
    );
  }
}

class Slots {
  List<NewsScreen> news;

  Slots({required this.news});

  factory Slots.fromJson(Map<String, dynamic> json) {
    var data = json['newsScreen'] as List;
    return Slots(
      news: data.map((news) => NewsScreen.fromJson(news)).toList(),
    );
  }
}

class NewsScreen {
  Parameters parameters;

  NewsScreen({required this.parameters});

  factory NewsScreen.fromJson(Map<String, dynamic> json) {
    return NewsScreen(
      parameters: Parameters.fromJson(json['parameters']),
    );
  }
}

class Parameters {
  NewsImage newsImage;
  NewsTitle newsTitle;

  Parameters({required this.newsImage, required this.newsTitle});

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      newsImage: NewsImage.fromJson(json['newsImage']),
      newsTitle: NewsTitle.fromJson(json['newsTitle']),
    );
  }
}

class NewsImage {
  Value value;

  NewsImage({required this.value});

  factory NewsImage.fromJson(Map<String, dynamic> json) {
    return NewsImage(
      value: Value.fromJson(json['value'][0]),
    );
  }
}

class Value {
  String url;

  Value({required this.url});

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      url: json['url'],
    );
  }
}

class NewsTitle {
  String value;

  NewsTitle({required this.value});

  factory NewsTitle.fromJson(Map<String, dynamic> json) {
    return NewsTitle(
      value: json['value'],
    );
  }
}
