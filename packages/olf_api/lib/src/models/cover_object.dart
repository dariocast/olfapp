import 'dart:convert';

import 'package:olf_api/src/models/models.dart';

class CoverObject {
  final String type;
  final ExternalObject external;
  CoverObject({
    required this.type,
    required this.external,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'external': external.toMap(),
    };
  }

  factory CoverObject.fromMap(Map<String, dynamic> map) {
    return CoverObject(
      type: map['type'] as String,
      external: ExternalObject.fromMap(map['external'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoverObject.fromJson(String source) =>
      CoverObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CoverObject(type: $type, external: $external)';
}
