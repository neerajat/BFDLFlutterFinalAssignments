class Carousal {
  String? sectionName;
  String? ctaText;
  String? redirectionKey;
  String? redirectionValue;
  List<ImageList>? list;

  Carousal(
      {this.sectionName,
        this.ctaText,
        this.redirectionKey,
        this.redirectionValue,
        this.list});

  Carousal.fromJson(Map<String, dynamic> json) {
    sectionName = json['section_name'];
    ctaText = json['ctaText'];
    redirectionKey = json['redirectionKey'];
    redirectionValue = json['redirectionValue'];
    if (json['list'] != null) {
      list = <ImageList>[];
      json['list'].forEach((v) {
        list?.add(ImageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_name'] = sectionName;
    data['ctaText'] = ctaText;
    data['redirectionKey'] = redirectionKey;
    data['redirectionValue'] = redirectionValue;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageList {
  String? largeText;
  String? smallText1;
  String? smallText2;
  String? image;
  String? imageIcon2;

  ImageList(
      { this.largeText,
        this.smallText1,
        this.smallText2,
        this.image,
        this.imageIcon2});

  ImageList.fromJson(Map<String, dynamic> json) {
    largeText = json['largeText'];
    smallText1 = json['smallText1'];
    smallText2 = json['smallText2'];
    image = json['image'];
    imageIcon2 = json['imageIcon2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['largeText'] = largeText;
    data['smallText1'] = smallText1;
    data['smallText2'] = smallText2;
    data['image'] = image;
    data['imageIcon2'] = imageIcon2;
    return data;
  }
}
