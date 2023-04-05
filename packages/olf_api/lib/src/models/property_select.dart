import 'dart:convert';

class PropertySelect {
  String? id;
  String? type;
  Select? select;
  PropertySelect({
    this.id,
    this.type,
    this.select,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'select': select?.toMap(),
    };
  }

  factory PropertySelect.fromMap(Map<String, dynamic> map) {
    return PropertySelect(
      id: map['id'] as String?,
      type: map['type'] as String?,
      select: map['select'] != null
          ? Select.fromMap(map['select'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertySelect.fromJson(String source) =>
      PropertySelect.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PropertySelect(id: $id, type: $type, select: $select)';
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
