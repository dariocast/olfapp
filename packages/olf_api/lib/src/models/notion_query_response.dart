import 'dart:convert';

import './models.dart';

class NotionQueryResponse {
  final String object;
  final List<NotionObject> results;
  final String? nextCursor;
  final bool hasMore = false;
  final String type;
  final Map<dynamic, dynamic> page;
  NotionQueryResponse({
    required this.object,
    required this.results,
    this.nextCursor,
    required this.type,
    required this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'results': results.map((x) => x.toMap()).toList(),
      'next_cursor': nextCursor,
      'type': type,
      'page': page,
    };
  }

  factory NotionQueryResponse.fromMap(Map<String, dynamic> map) {
    return NotionQueryResponse(
      object: map['object'] as String,
      results: List<NotionObject>.from((map['results'] as List?)!
          .map((x) => NotionObject.fromMap(x as Map<String, dynamic>))),
      nextCursor: map['next_cursor'] as String?,
      type: map['type'] as String,
      page: Map<dynamic, dynamic>.from(map['page'] as Map<dynamic, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotionQueryResponse.fromJson(String source) =>
      NotionQueryResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotionQueryResponse(object: $object, results: $results, nextCursor: $nextCursor, type: $type, page: $page)';
  }
}
