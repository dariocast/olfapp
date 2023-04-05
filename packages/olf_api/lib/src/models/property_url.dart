import 'dart:convert';

class PropertyUrl {
  String? id;
  String? name;
  String? type;
  String? url;
  PropertyUrl({
    this.id,
    this.name,
    this.type,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'url': url,
    };
  }

  factory PropertyUrl.fromMap(Map<String, dynamic> map) {
    return PropertyUrl(
      id: map['id'] as String?,
      name: map['name'] as String?,
      type: map['type'] as String?,
      url: map['url'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyUrl.fromJson(String source) =>
      PropertyUrl.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyUrl(id: $id, name: $name, type: $type, url: $url)';
  }
}
