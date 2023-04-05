import 'dart:convert';

import 'package:notion_query_api/src/models/models.dart';

class NotionObject {
  final String? object;
  final String? id;
  final String? createdTime;
  final String? lastEditedTime;
  final GenericNotionObject? createdBy;
  final GenericNotionObject? lastEditedBy;
  final CoverObject? cover;
  final IconObject? icon;
  final ParentObject? parent;
  final bool? archived;
  final List<dynamic>? properties;
  final String? url;

  NotionObject({
    this.object,
    this.id,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.lastEditedBy,
    this.cover,
    this.icon,
    this.parent,
    this.archived,
    this.properties,
    this.url,
  });

  @override
  String toString() {
    return 'NotionObject(object: $object, id: $id, createdTime: $createdTime'
        ', lastEditedTime: $lastEditedTime, createdBy: $createdBy'
        ', lastEditedBy: $lastEditedBy, cover: $cover, icon: $icon'
        ', parent: $parent, archived: $archived, properties: $properties'
        ', url: $url)';
  }

  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'id': id,
      'created_time': createdTime,
      'last_edited_time': lastEditedTime,
      'created_by': createdBy?.toMap(),
      'last_edited_by': lastEditedBy?.toMap(),
      'cover': cover?.toMap(),
      'icon': icon?.toMap(),
      'parent': parent?.toMap(),
      'archived': archived,
      'properties': properties?.map((x) => x.toMap()).toList(),
      'url': url,
    };
  }

  factory NotionObject.fromMap(Map<String, dynamic> map) {
    return NotionObject(
      object: map['object'] as String?,
      id: map['id'] as String?,
      createdTime: map['created_time'] as String?,
      lastEditedTime: map['last_edited_time'] as String?,
      createdBy: map['created_by'] != null
          ? GenericNotionObject.fromMap(
              map['created_by'] as Map<String, dynamic>,
            )
          : null,
      lastEditedBy: map['last_edited_by'] != null
          ? GenericNotionObject.fromMap(
              map['last_edited_by'] as Map<String, dynamic>,
            )
          : null,
      cover: map['cover'] != null
          ? CoverObject.fromMap(map['cover'] as Map<String, dynamic>)
          : null,
      icon: map['icon'] != null
          ? IconObject.fromMap(map['icon'] as Map<String, dynamic>)
          : null,
      parent: map['parent'] != null
          ? ParentObject.fromMap(map['parent'] as Map<String, dynamic>)
          : null,
      archived: map['archived'] as bool?,
      properties: map['properties'] != null
          ? (map['properties'] as Map<String, dynamic>).entries.map((e) {
              switch (e.value['type']) {
                case 'title':
                  final map = e.value as Map<String, dynamic>;
                  if (map['name'] == null) {
                    map['name'] = e.key;
                  }
                  return PropertyTitle.fromMap(map);
                case 'rich_text':
                  final map = e.value as Map<String, dynamic>;
                  if (map['name'] == null) {
                    map['name'] = e.key;
                  }
                  return PropertyRichText.fromMap(map);
                case 'select':
                  final map = e.value as Map<String, dynamic>;
                  if (map['name'] == null) {
                    map['name'] = e.key;
                  }
                  return PropertySelect.fromMap(map);
                case 'url':
                  final map = e.value as Map<String, dynamic>;
                  if (map['name'] == null) {
                    map['name'] = e.key;
                  }
                  return PropertyUrl.fromMap(map);
                case 'created_time':
                  final map = e.value as Map<String, dynamic>;
                  if (map['name'] == null) {
                    map['name'] = e.key;
                  }
                  return PropertyCreatedTime.fromMap(map);
                default:
                  final map = e.value as Map<String, dynamic>;
                  if (map['name'] == null) {
                    map['name'] = e.key;
                  }
                  return GenericPropertyObject.fromMap(map);
              }
            }).toList()
          : null,
      url: map['url'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotionObject.fromJson(String source) =>
      NotionObject.fromMap(json.decode(source) as Map<String, dynamic>);
}
