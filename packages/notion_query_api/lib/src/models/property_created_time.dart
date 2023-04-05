import 'dart:convert';

import 'package:notion_query_api/src/models/generic_property_object.dart';

class PropertyCreatedTime extends GenericPropertyObject<String> {
  PropertyCreatedTime({
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
        'created_time': property,
      });
    return map;
  }

  factory PropertyCreatedTime.fromMap(Map<String, dynamic> map) {
    return PropertyCreatedTime(
      id: map['id'] as String,
      name: map['name'] as String,
      type: PropertyType.fromType(map['type'] as String),
      property: map['created_time'] as String?,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory PropertyCreatedTime.fromJson(String source) =>
      PropertyCreatedTime.fromMap(json.decode(source) as Map<String, dynamic>);
}
