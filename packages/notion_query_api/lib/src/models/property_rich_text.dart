import 'dart:convert';

import 'package:notion_query_api/src/models/models.dart';

class PropertyRichText extends GenericPropertyObject<List<RichText>> {
  PropertyRichText({
    required super.id,
    required super.name,
    required super.type,
    super.property,
  });

  @override
  List<RichText> get property => super.property ?? List.empty();

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap()
      ..addAll({
        'rich_text': property,
      });
    return map;
  }

  factory PropertyRichText.fromMap(Map<String, dynamic> map) {
    return PropertyRichText(
      id: map['id'] as String,
      name: map['name'] as String,
      type: PropertyType.fromType(map['type'] as String),
      property: map['rich_text'] != null
          ? List<RichText>.from(
              (map['rich_text'] as List?)!
                  .map((x) => RichText.fromMap(x as Map<String, dynamic>)),
            )
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory PropertyRichText.fromJson(String source) =>
      PropertyRichText.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RichText {
  String? type;
  // RichTextText? text;
  String? plainText;
  RichText({
    this.type,
    this.plainText,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'plain_text': plainText,
    };
  }

  factory RichText.fromMap(Map<String, dynamic> map) {
    return RichText(
      type: map['type'] as String?,
      plainText: map['plain_text'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory RichText.fromJson(String source) =>
      RichText.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RichText(type: $type, plainText: $plainText)';
}

// class RichTextText {
//   String? content;
//   String? link;

//   RichTextText({this.content, this.link});

//   Map<String, dynamic> toMap() {
//     return {
//       'content': content,
//       'link': link,
//     };
//   }

//   factory RichTextText.fromMap(Map<String, dynamic> map) {
//     return RichTextText(
//       content: map['content'] as String?,
//       link: map['link'] as String?,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory RichTextText.fromJson(String source) =>
//       RichTextText.fromMap(json.decode(source) as Map<String, dynamic>);
// }
