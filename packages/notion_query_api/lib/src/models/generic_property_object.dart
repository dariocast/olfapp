import 'dart:convert';

enum PropertyType {
  checkbox(value: 'checkbox'),
  createdBy(value: 'created_by'),
  createdTime(value: 'created_time'),
  date(value: 'date'),
  email(value: 'email'),
  files(value: 'files'),
  formula(value: 'formula'),
  lastEditedBy(value: 'last_edited_by'),
  lastEditedTime(value: 'last_edited_time'),
  multiSelect(value: 'multi_select'),
  number(value: 'number'),
  people(value: 'people'),
  phone(value: 'phone'),
  relation(value: 'relation'),
  richText(value: 'rich_text'),
  rollup(value: 'rollup'),
  select(value: 'select'),
  status(value: 'status'),
  title(value: 'title'),
  url(value: 'url');

  const PropertyType({
    required this.value,
  });

  factory PropertyType.fromType(String type) {
    return values.firstWhere((e) => e.value == type);
  }

  final String value;

  String get type => value;
}

class GenericPropertyObject<GenericProperty> {
  String id;
  String name;
  PropertyType type;
  GenericProperty? _property;
  GenericPropertyObject({
    required this.id,
    required this.name,
    required this.type,
    GenericProperty? property,
  }) : _property = property;

  GenericProperty? get property => _property;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type.value,
    };
  }

  factory GenericPropertyObject.fromMap(Map<String, dynamic> map) {
    return GenericPropertyObject(
      id: map['id'] as String,
      name: map['name'] as String,
      type: PropertyType.fromType(map['type'] as String),
      property: map['property'] as GenericProperty?,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenericPropertyObject.fromJson(String source) =>
      GenericPropertyObject.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'GenericPropertyObject(id: $id, name: $name, type: $type, property: $_property)';
  }
}
