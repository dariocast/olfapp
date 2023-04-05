import 'dart:convert';

class PropertyTitle {
  String? id;
  String? type;
  List<Title>? title;
  PropertyTitle({
    this.id,
    this.type,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title?.map((x) => x.toMap()).toList(),
    };
  }

  factory PropertyTitle.fromMap(Map<String, dynamic> map) {
    return PropertyTitle(
      id: map['id'] as String?,
      type: map['type'] as String?,
      title: map['title'] != null
          ? List<Title>.from(
              (map['title'] as List?)!
                  .map((x) => Title.fromMap(x as Map<String, dynamic>)),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyTitle.fromJson(String source) =>
      PropertyTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PropertyTitle(id: $id, type: $type, title: $title)';
}

class Title {
  String? type;
  TitleText? text;
  String? plainText;
  Title({
    this.type,
    this.plainText,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'plain_text': plainText,
    };
  }

  factory Title.fromMap(Map<String, dynamic> map) {
    return Title(
      type: map['type'] as String?,
      plainText: map['plain_text'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Title.fromJson(String source) =>
      Title.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Title(type: $type, plainText: $plainText)';
}

class TitleText {
  String? content;
  String? link;
  TitleText({
    this.content,
    this.link,
  });

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'link': link,
    };
  }

  factory TitleText.fromMap(Map<String, dynamic> map) {
    return TitleText(
      content: map['content'] as String?,
      link: map['link'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory TitleText.fromJson(String source) =>
      TitleText.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TitleText(content: $content, link: $link)';
}
