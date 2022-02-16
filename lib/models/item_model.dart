class Item {
  Item({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Item.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() => {
    'albumId': albumId,
    'id': id,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };
}
