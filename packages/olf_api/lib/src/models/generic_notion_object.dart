import 'dart:convert';

class GenericNotionObject {
  final String object;
  final String id;
  GenericNotionObject({
    required this.object,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'id': id,
    };
  }

  factory GenericNotionObject.fromMap(Map<String, dynamic> map) {
    return GenericNotionObject(
      object: map['object'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenericNotionObject.fromJson(String source) =>
      GenericNotionObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenericNotionObject(object: $object, id: $id)';
}
