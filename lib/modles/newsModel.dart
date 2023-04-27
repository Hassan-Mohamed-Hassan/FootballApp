class NewsModel {
  NewsModel({
    required this.newsLink,
    required this.image,
    required this.title,
    required this.publisherLogo,
    required this.publisherName,
    required this.publisherDate,
  });

  final String? newsLink;
  final String? image;
  final String? title;
  final String? publisherLogo;
  final String? publisherName;
  final String? publisherDate;

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      newsLink: json["NewsLink"],
      image: json["Image"],
      title: json["Title"],
      publisherLogo: json["PublisherLogo"],
      publisherName: json["PublisherName"],
      publisherDate: json["PublisherDate"],
    );
  }

  Map<String, dynamic> toJson() => {
    "NewsLink": newsLink,
    "Image": image,
    "Title": title,
    "PublisherLogo": publisherLogo,
    "PublisherName": publisherName,
    "PublisherDate": publisherDate,
  };

}
