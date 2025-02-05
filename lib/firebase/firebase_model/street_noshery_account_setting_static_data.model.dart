class NotificationSettings {
  final String? whatsApp;
  final String? sms;
  final MessageDetails? orderRelatedMessages;
  final String? title;
  final MessageDetails? recommendations;
  final MessageDetails? accountDelete;

  NotificationSettings({
    this.whatsApp,
    this.sms,
    this.orderRelatedMessages,
    this.title,
    this.recommendations,
    this.accountDelete,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      whatsApp: json['whatsApp'] as String?,
      sms: json['sms'] as String?,
      orderRelatedMessages: json['orderRelatedMessages'] != null
          ? MessageDetails.fromJson(json['orderRelatedMessages'])
          : null,
      title: json['title'] as String?,
      recommendations: json['recommendations'] != null
          ? MessageDetails.fromJson(json['recommendations'])
          : null,
      accountDelete: json['accountDelete'] != null
          ? MessageDetails.fromJson(json['accountDelete'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'whatsApp': whatsApp,
      'sms': sms,
      'orderRelatedMessages': orderRelatedMessages?.toJson(),
      'title': title,
      'recommendations': recommendations?.toJson(),
      'accountDelete': accountDelete?.toJson(),
    };
  }
}

class MessageDetails {
  final String? subTitle;
  final String? title;

  MessageDetails({this.subTitle, this.title});

  factory MessageDetails.fromJson(Map<String, dynamic> json) {
    return MessageDetails(
      subTitle: json['subTitle'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subTitle': subTitle,
      'title': title,
    };
  }
}
