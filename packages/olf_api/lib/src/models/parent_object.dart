import 'dart:convert';

class ParentObject {
  final String type;
  final String databaseId;
  ParentObject({
    required this.type,
    required this.databaseId,
  });

  ParentObject copyWith({
    String? type,
    String? databaseId,
  }) {
    return ParentObject(
      type: type ?? this.type,
      databaseId: databaseId ?? this.databaseId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'database_id': databaseId,
    };
  }

  factory ParentObject.fromMap(Map<String, dynamic> map) {
    return ParentObject(
      type: map['type'] as String,
      databaseId: map['database_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentObject.fromJson(String source) =>
      ParentObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ParentObject(type: $type, databaseId: $databaseId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParentObject &&
        other.type == type &&
        other.databaseId == databaseId;
  }

  @override
  int get hashCode => type.hashCode ^ databaseId.hashCode;
}
