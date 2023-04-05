import 'dart:convert';

class PropertyCreatedTime {
  String? id;
  String? type;
  String? createdTime;
  PropertyCreatedTime({
    this.id,
    this.type,
    this.createdTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'created_time': createdTime,
    };
  }

  factory PropertyCreatedTime.fromMap(Map<String, dynamic> map) {
    return PropertyCreatedTime(
      id: map['id'] as String?,
      type: map['type'] as String?,
      createdTime: map['created_time'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyCreatedTime.fromJson(String source) =>
      PropertyCreatedTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PropertyCreatedTime(id: $id, type: $type, createdTime: $createdTime)';
}
