class StreetNosheryHelpAndSupportFirebasemodel {
  final String? title;
  final Body? body;

  StreetNosheryHelpAndSupportFirebasemodel({this.title, this.body});

  factory StreetNosheryHelpAndSupportFirebasemodel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryHelpAndSupportFirebasemodel(
      title: json['title'] as String? ?? '',
      body: json['body'] != null ? Body.fromJson(json['body']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body?.toJson(),
    };
  }
}

class Body {
  final String? subTitle;
  final String? callUs;
  final String? title;

  Body({this.subTitle, this.callUs, this.title});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      subTitle: json['subTitle'] as String? ?? '',
      callUs: json['callUs'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subTitle': subTitle,
      'callUs': callUs,
      'title': title,
    };
  }
}
