import 'dart:convert';

import 'package:notion_query_api/src/models/models.dart';

class PropertySelect extends GenericPropertyObject<Select> {
  PropertySelect({
    required super.id,
    required super.name,
    required super.type,
    super.property,
  });

  @override
  Select get property => super.property ?? Select();

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap()
      ..addAll({
        'select': property,
      });
    return map;
  }

  factory PropertySelect.fromMap(Map<String, dynamic> map) {
    return PropertySelect(
      id: map['id'] as String,
      name: map['name'] as String,
      type: PropertyType.fromType(map['type'] as String),
      property: map['select'] != null
          ? Select.fromMap(map['select'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory PropertySelect.fromJson(String source) =>
      PropertySelect.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Select {
  String? id;
  String? name;
  String? color;
  Select({
    this.id,
    this.name,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory Select.fromMap(Map<String, dynamic> map) {
    return Select(
      id: map['id'] as String?,
      name: map['name'] as String?,
      color: map['color'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Select.fromJson(String source) =>
      Select.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Select(id: $id, name: $name, color: $color)';
}
