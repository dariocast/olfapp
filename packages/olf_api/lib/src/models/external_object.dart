import 'dart:convert';

class ExternalObject {
  final String url;
  ExternalObject({
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory ExternalObject.fromMap(Map<String, dynamic> map) {
    return ExternalObject(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExternalObject.fromJson(String source) =>
      ExternalObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ExternalObject(url: $url)';
}
