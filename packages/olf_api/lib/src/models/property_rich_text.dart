import 'dart:convert';

class PropertyRichText {
  String? id;
  String? type;
  List<RichText>? richText;
  PropertyRichText({
    this.id,
    this.type,
    this.richText,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'rich_text': richText?.map((x) => x.toMap()).toList(),
    };
  }

  factory PropertyRichText.fromMap(Map<String, dynamic> map) {
    return PropertyRichText(
      id: map['id'] as String?,
      type: map['type'] as String?,
      richText: map['rich_text'] != null
          ? List<RichText>.from(
              (map['rich_text'] as List?)!
                  .map((x) => RichText.fromMap(x as Map<String, dynamic>)),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyRichText.fromJson(String source) =>
      PropertyRichText.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PropertyRichText(id: $id, type: $type, richText: $richText)';
}

class RichText {
  String? type;
  RichTextText? text;
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

class RichTextText {
  String? content;
  String? link;

  RichTextText({this.content, this.link});

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'link': link,
    };
  }

  factory RichTextText.fromMap(Map<String, dynamic> map) {
    return RichTextText(
      content: map['content'] as String?,
      link: map['link'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory RichTextText.fromJson(String source) =>
      RichTextText.fromMap(json.decode(source) as Map<String, dynamic>);
}
