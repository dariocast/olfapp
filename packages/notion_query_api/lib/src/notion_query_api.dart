import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:notion_query_api/src/models/models.dart';

class NotionQueryApi {
  final String _baseUrl;
  final String _apiToken;
  final String _notionVersion = '2022-06-28';

  final http.Client _client;

  NotionQueryApi({
    required String baseUrl,
    required String apiToken,
    http.Client? client,
  })  : _client = client ?? http.Client(),
        _baseUrl = baseUrl,
        _apiToken = apiToken;

  void dispose() {
    _client.close();
  }

  Future<List<NotionObject>> query({required String databaseId}) async {
    try {
      final url = '${_baseUrl}databases/$databaseId/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $_apiToken',
          'Notion-Version': _notionVersion,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) {
          if (e is Map<String, dynamic>) {
            return NotionObject.fromMap(e);
          }
          return NotionObject();
        }).toList();
      } else {
        throw Exception('Response fails with status ${response.statusCode}!');
      }
    } catch (ex) {
      throw Exception('Something went wrong!');
    }
  }
}
