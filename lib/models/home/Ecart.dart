class Ecart {
  Payload? payload;

  Ecart({this.payload});

  Ecart.fromJson(Map<String, dynamic> json) {
    payload =
    json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}

class Payload {

  List<PersonalizationSequence>? personalizationSequence;

  Payload(
      {
        this.personalizationSequence});

  Payload.fromJson(Map<String, dynamic> json) {

    if (json['personalizationSequence'] != null) {
      personalizationSequence = <PersonalizationSequence>[];
      json['personalizationSequence'].forEach((v) {
        personalizationSequence!.add(PersonalizationSequence.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (personalizationSequence != null) {
      data['personalizationSequence'] =
          personalizationSequence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalizationSequence {
  String? widgetId;
  String? widgetHeader;
  String? sectionName;
  String? microinteractionType;
  bool? microinteractionFlag;
  List<CtaDetails>? ctaDetails;
  WidgetLayout? widgetLayout;
  List<WidgetComponentDetailsECart>? widgetComponentDetails;
  bool? scrollingDots;
  String? scrollingDotsAlignment;
  String? backgroundImage;
  String? showCta;
  String? ctaText;
  String? ctaRedirectionKey;
  String? ctaRedirectionValue;

  PersonalizationSequence(
      {this.widgetId,
        this.widgetHeader,
        this.sectionName,
        this.microinteractionType,
        this.microinteractionFlag,
        this.ctaDetails,
        this.widgetLayout,
        this.widgetComponentDetails,
        this.scrollingDots,
        this.scrollingDotsAlignment,
        this.backgroundImage,
        this.showCta,
        this.ctaText,
        this.ctaRedirectionKey,
        this.ctaRedirectionValue});

  PersonalizationSequence.fromJson(Map<String, dynamic> json) {
    widgetId = json['widget_id'];
    widgetHeader = json['widget_header'];
    sectionName = json['section_name'];
    microinteractionType = json['microinteractionType'];
    microinteractionFlag = json['microinteractionFlag'];
    if (json['ctaDetails'] != null) {
      ctaDetails = <CtaDetails>[];
      json['ctaDetails'].forEach((v) {
        ctaDetails!.add(CtaDetails.fromJson(v));
      });
    }
    widgetLayout = json['widget_layout'] != null
        ? WidgetLayout.fromJson(json['widget_layout'])
        : null;
    if (json['widgetComponentDetails'] != null) {
      widgetComponentDetails = <WidgetComponentDetailsECart>[];
      json['widgetComponentDetails'].forEach((v) {
        widgetComponentDetails!.add(WidgetComponentDetailsECart.fromJson(v));
      });
    }
    sectionName = json['sectionName'];
    scrollingDots = json['scrolling_dots'];
    scrollingDotsAlignment = json['scrolling_dots_alignment'];
    backgroundImage = json['backgroundImage'];
    showCta = json['showCta'];
    ctaText = json['ctaText'];
    ctaRedirectionKey = json['ctaRedirectionKey'];
    ctaRedirectionValue = json['ctaRedirectionValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widget_id'] = widgetId;
    data['widget_header'] = widgetHeader;
    data['section_name'] = sectionName;
    data['microinteractionType'] = microinteractionType;
    data['microinteractionFlag'] = microinteractionFlag;
    if (ctaDetails != null) {
      data['ctaDetails'] = ctaDetails!.map((v) => v.toJson()).toList();
    }
    if (widgetLayout != null) {
      data['widget_layout'] = widgetLayout!.toJson();
    }
    if (widgetComponentDetails != null) {
      data['widgetComponentDetails'] =
          widgetComponentDetails!.map((v) => v.toJson()).toList();
    }
    data['sectionName'] = sectionName;
    data['scrolling_dots'] = scrollingDots;
    data['scrolling_dots_alignment'] = scrollingDotsAlignment;
    data['backgroundImage'] = backgroundImage;
    data['showCta'] = showCta;
    data['ctaText'] = ctaText;
    data['ctaRedirectionKey'] = ctaRedirectionKey;
    data['ctaRedirectionValue'] = ctaRedirectionValue;
    return data;
  }
}

class CtaDetails {
  bool? showCta;
  String? ctaType;
  String? ctaFormat;
  String? ctaText;
  String? imageIcon;
  String? redirectionType;
  String? redirectionKey;
  String? redirectionValue;

  CtaDetails(
      {this.showCta,
        this.ctaType,
        this.ctaFormat,
        this.ctaText,
        this.imageIcon,
        this.redirectionType,
        this.redirectionKey,
        this.redirectionValue});

  CtaDetails.fromJson(Map<String, dynamic> json) {
    showCta = json['showCta'];
    ctaType = json['ctaType'];
    ctaFormat = json['ctaFormat'];
    ctaText = json['ctaText'];
    imageIcon = json['imageIcon'];
    redirectionType = json['redirectionType'];
    redirectionKey = json['redirectionKey'];
    redirectionValue = json['redirectionValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showCta'] = showCta;
    data['ctaType'] = ctaType;
    data['ctaFormat'] = ctaFormat;
    data['ctaText'] = ctaText;
    data['imageIcon'] = imageIcon;
    data['redirectionType'] = redirectionType;
    data['redirectionKey'] = redirectionKey;
    data['redirectionValue'] = redirectionValue;
    return data;
  }
}

class WidgetLayout {

  bool? horizontalScrollEnabled;


  WidgetLayout(
      {
        this.horizontalScrollEnabled,
        });

  WidgetLayout.fromJson(Map<String, dynamic> json) {

    horizontalScrollEnabled = json['horizontal_scroll_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['horizontal_scroll_enabled'] = horizontalScrollEnabled;
    return data;
  }
}


class WidgetComponentDetailsECart {
  String? name;
  String? backgroundImage;
  String? tag;
  String? tagBgColor;
  String? tagTextColor;
  String? assetType;
  String? imageIcon;
  String? redirectionKey;
  String? redirectionValue;
  String? pid;
  String? tagColor;
  String? tagLine;
  String? productName;
  String? l2productCode;
  String? l3productCode;
  String? title;
  String? featureText1;
  String? featureText2;

  WidgetComponentDetailsECart(
      {this.name,
        this.backgroundImage,
        this.tag,
        this.tagBgColor,
        this.tagTextColor,
        this.assetType,
        this.imageIcon,
        this.redirectionKey,
        this.redirectionValue,
        this.pid,
        this.tagColor,
        this.tagLine,
        this.productName,
        this.l2productCode,
        this.l3productCode,
        this.title,
        this.featureText1,
        this.featureText2});

  WidgetComponentDetailsECart.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    backgroundImage = json['backgroundImage'];
    tag = json['tag'];
    tagBgColor = json['tagBgColor'];
    tagTextColor = json['tagTextColor'];
    assetType = json['asset_type'];
    imageIcon = json['imageIcon'];
    redirectionKey = json['redirectionKey'];
    redirectionValue = json['redirectionValue'];
    pid = json['pid'];
    tagColor = json['tagColor'];
    tagLine = json['tagLine'];
    productName = json['productName'];
    l2productCode = json['L2productCode'];
    l3productCode = json['L3productCode'];
    title = json['title'];
    featureText1 = json['featureText1'];
    featureText2 = json['featureText2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['backgroundImage'] = backgroundImage;
    data['tag'] = tag;
    data['tagBgColor'] = tagBgColor;
    data['tagTextColor'] = tagTextColor;
    data['asset_type'] = assetType;
    data['imageIcon'] = imageIcon;
    data['redirectionKey'] = redirectionKey;
    data['redirectionValue'] = redirectionValue;
    data['pid'] = pid;
    data['tagColor'] = tagColor;
    data['tagLine'] = tagLine;
    data['productName'] = productName;
    data['L2productCode'] = l2productCode;
    data['L3productCode'] = l3productCode;
    data['title'] = title;
    data['featureText1'] = featureText1;
    data['featureText2'] = featureText2;
    return data;
  }
}
