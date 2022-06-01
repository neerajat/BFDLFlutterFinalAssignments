class HomePage {
  String? payload;
  String? platform;
  String? appVersion;
  Dock? dock;
  OneMarketPlace? oneMarketPlace;
  Header? header;
  HomeTabView? homeTabView;
  Search? search;
  FabIcon? fabIcon;

  HomePage(
      {this.payload,
        this.platform,
        this.appVersion,
        this.dock,
        this.oneMarketPlace,
        this.header,
        this.homeTabView,
        this.search,
        this.fabIcon});

  HomePage.fromJson(Map<String, dynamic> json) {
    payload = json['payload'];
    platform = json['platform'];
    appVersion = json['appVersion'];
    dock = json['dock'] != null ? Dock.fromJson(json['dock']) : null;
    oneMarketPlace = json['oneMarketPlace'] != null
        ? OneMarketPlace.fromJson(json['oneMarketPlace'])
        : null;
    header =
    json['header'] != null ? Header.fromJson(json['header']) : null;
    homeTabView = json['homeTabView'] != null
        ? HomeTabView.fromJson(json['homeTabView'])
        : null;
    search =
    json['search'] != null ? Search.fromJson(json['search']) : null;
    fabIcon =
    json['fabIcon'] != null ? FabIcon.fromJson(json['fabIcon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payload'] = payload;
    data['platform'] = platform;
    data['appVersion'] = appVersion;
    if (dock != null) {
      data['dock'] = dock!.toJson();
    }
    if (oneMarketPlace != null) {
      data['oneMarketPlace'] = oneMarketPlace!.toJson();
    }
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (homeTabView != null) {
      data['homeTabView'] = homeTabView!.toJson();
    }
    if (search != null) {
      data['search'] = search!.toJson();
    }
    if (fabIcon != null) {
      data['fabIcon'] = fabIcon!.toJson();
    }
    return data;
  }
}

class Dock {
  String? widgetId;
  List<WidgetComponentDetails>? widgetComponentDetails;

  Dock({this.widgetId, this.widgetComponentDetails});

  Dock.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    if (json['widgetComponentDetails'] != null) {
      widgetComponentDetails = <WidgetComponentDetails>[];
      json['widgetComponentDetails'].forEach((v) {
        widgetComponentDetails!.add(WidgetComponentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    if (widgetComponentDetails != null) {
      data['widgetComponentDetails'] =
          widgetComponentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WidgetComponentDetails {
  String? name;
  String? imageIcon;
  String? redirectionKey;
  String? redirectionValue;
  String? jsonLink;

  WidgetComponentDetails(
      {this.name,
        this.imageIcon,
        this.redirectionKey,
        this.redirectionValue,
        this.jsonLink});

  WidgetComponentDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageIcon = json['imageIcon'];
    redirectionKey = json['redirectionKey'];
    redirectionValue = json['redirectionValue'];
    jsonLink = json['jsonLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageIcon'] = imageIcon;
    data['redirectionKey'] = redirectionKey;
    data['redirectionValue'] = redirectionValue;
    data['jsonLink'] = jsonLink;
    return data;
  }
}

class OneMarketPlace {
  String? widgetId;
  String? sectionName;
  String? backgroundImage;
  String? showCta;
  String? ctaText;
  String? jsonLink;
  String? ctaRedirectionKey;
  String? ctaRedirectionValue;

  OneMarketPlace(
      {this.widgetId,
        this.sectionName,
        this.backgroundImage,
        this.showCta,
        this.ctaText,
        this.jsonLink,
        this.ctaRedirectionKey,
        this.ctaRedirectionValue});

  OneMarketPlace.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    sectionName = json['sectionName'];
    backgroundImage = json['backgroundImage'];
    showCta = json['showCta'];
    ctaText = json['ctaText'];
    jsonLink = json['jsonLink'];
    ctaRedirectionKey = json['ctaRedirectionKey'];
    ctaRedirectionValue = json['ctaRedirectionValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    data['sectionName'] = sectionName;
    data['backgroundImage'] = backgroundImage;
    data['showCta'] = showCta;
    data['ctaText'] = ctaText;
    data['jsonLink'] = jsonLink;
    data['ctaRedirectionKey'] = ctaRedirectionKey;
    data['ctaRedirectionValue'] = ctaRedirectionValue;
    return data;
  }
}

class Header {
  String? widgetId;
  String? sectionName;
  String? backgroundImage;
  String? ctaText;
  String? ctaRedirectionKey;
  String? ctaRedirectionValue;
  List<WidgetComponentDetails>? widgetComponentDetails;

  Header(
      {this.widgetId,
        this.sectionName,
        this.backgroundImage,
        this.ctaText,
        this.ctaRedirectionKey,
        this.ctaRedirectionValue,
        this.widgetComponentDetails});

  Header.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    sectionName = json['sectionName'];
    backgroundImage = json['backgroundImage'];
    ctaText = json['ctaText'];
    ctaRedirectionKey = json['ctaRedirectionKey'];
    ctaRedirectionValue = json['ctaRedirectionValue'];
    if (json['widgetComponentDetails'] != null) {
      widgetComponentDetails = <WidgetComponentDetails>[];
      json['widgetComponentDetails'].forEach((v) {
        widgetComponentDetails!.add(WidgetComponentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    data['sectionName'] = sectionName;
    data['backgroundImage'] = backgroundImage;
    data['ctaText'] = ctaText;
    data['ctaRedirectionKey'] = ctaRedirectionKey;
    data['ctaRedirectionValue'] = ctaRedirectionValue;
    if (widgetComponentDetails != null) {
      data['widgetComponentDetails'] =
          widgetComponentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeTabView {
  String? widgetId;
  bool? showCta;
  List<WidgetComponentDetails>? widgetComponentDetails;

  HomeTabView({this.widgetId, this.showCta, this.widgetComponentDetails});

  HomeTabView.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    showCta = json['showCta'];
    if (json['widgetComponentDetails'] != null) {
      widgetComponentDetails = <WidgetComponentDetails>[];
      json['widgetComponentDetails'].forEach((v) {
        widgetComponentDetails!.add(WidgetComponentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    data['showCta'] = showCta;
    if (widgetComponentDetails != null) {
      data['widgetComponentDetails'] =
          widgetComponentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Search {
  String? widgetId;
  String? sectionName;
  String? backgroundImage;
  String? showCta;
  String? ctaText;
  String? ctaRedirectionKey;
  String? ctaRedirectionValue;

  Search(
      {this.widgetId,
        this.sectionName,
        this.backgroundImage,
        this.showCta,
        this.ctaText,
        this.ctaRedirectionKey,
        this.ctaRedirectionValue});

  Search.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    sectionName = json['sectionName'];
    backgroundImage = json['backgroundImage'];
    showCta = json['showCta'];
    ctaText = json['ctaText'];
    ctaRedirectionKey = json['ctaRedirectionKey'];
    ctaRedirectionValue = json['ctaRedirectionValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    data['sectionName'] = sectionName;
    data['backgroundImage'] = backgroundImage;
    data['showCta'] = showCta;
    data['ctaText'] = ctaText;
    data['ctaRedirectionKey'] = ctaRedirectionKey;
    data['ctaRedirectionValue'] = ctaRedirectionValue;
    return data;
  }
}

class FabIcon {
  String? widgetId;
  String? sectionName;
  String? backgroundColor;
  String? name;
  String? imageIcon;
  String? showCta;
  String? ctaText;
  String? ctaRedirectionKey;
  String? ctaRedirectionValue;

  FabIcon(
      {this.widgetId,
        this.sectionName,
        this.backgroundColor,
        this.name,
        this.imageIcon,
        this.showCta,
        this.ctaText,
        this.ctaRedirectionKey,
        this.ctaRedirectionValue});

  FabIcon.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    sectionName = json['sectionName'];
    backgroundColor = json['backgroundColor'];
    name = json['name'];
    imageIcon = json['imageIcon'];
    showCta = json['showCta'];
    ctaText = json['ctaText'];
    ctaRedirectionKey = json['ctaRedirectionKey'];
    ctaRedirectionValue = json['ctaRedirectionValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    data['sectionName'] = sectionName;
    data['backgroundColor'] = backgroundColor;
    data['name'] = name;
    data['imageIcon'] = imageIcon;
    data['showCta'] = showCta;
    data['ctaText'] = ctaText;
    data['ctaRedirectionKey'] = ctaRedirectionKey;
    data['ctaRedirectionValue'] = ctaRedirectionValue;
    return data;
  }
}
