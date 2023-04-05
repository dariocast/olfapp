import 'dart:convert';

class IconObject {
  final String type;
  final String emoji;
  IconObject({
    required this.type,
    required this.emoji,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'emoji': emoji,
    };
  }

  factory IconObject.fromMap(Map<String, dynamic> map) {
    return IconObject(
      type: map['type'] as String,
      emoji: map['emoji'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IconObject.fromJson(String source) =>
      IconObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IconObject(type: $type, emoji: $emoji)';
}
