import 'dart:convert';

import 'package:notion_query_api/src/models/models.dart';

class PropertyUrl extends GenericPropertyObject<String> {
  PropertyUrl({
    required super.id,
    required super.name,
    required super.type,
    super.property,
  });

  @override
  String get property => super.property ?? '';

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap()
      ..addAll({
        'url': property,
      });
    return map;
  }

  factory PropertyUrl.fromMap(Map<String, dynamic> map) {
    return PropertyUrl(
      id: map['id'] as String,
      name: map['name'] as String,
      type: PropertyType.fromType(map['type'] as String),
      property: map['url'] as String?,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory PropertyUrl.fromJson(String source) =>
      PropertyUrl.fromMap(json.decode(source) as Map<String, dynamic>);
}
