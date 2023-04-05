import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:olf_api/src/models/models.dart';

class JobsRepository {
  static const String _baseUrl = 'https://api.notion.com/v1/';
  static const String _apiToken =
      'secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ';
  static const String _jobsDatabaseId = '283d2760f81548f0a7baca4b3e58d7d8';
  static const String _projectDatabaseId = 'e6a8a6760e3d4430b20a15d16f75f92e';
  static const String _notionVersion = '2022-06-28';

  final http.Client _client;

  JobsRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<NotionObject>> getJobs() async {
    try {
      const url = '${_baseUrl}databases/$_jobsDatabaseId/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $_apiToken',
          'Notion-Version': _notionVersion,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        // print(data);
        return (data['results'] as List).map((e) {
          if (e is Map<String, dynamic>) {
            return NotionObject.fromMap(e);
          }
          return NotionObject();
        }).toList();
      } else {
        throw Exception('Response fails with status ${response.statusCode}!');
      }
    } catch (ex, stacktrace) {
      developer.log('$ex');
      developer.log('$stacktrace');
      throw Exception('Something went wrong!');
    }
  }

  Future<List<NotionObject>> getProjectAdv() async {
    try {
      const url = '${_baseUrl}databases/$_projectDatabaseId/query';
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
    } catch (ex, stacktrace) {
      developer.log('$ex');
      developer.log('$stacktrace');
      throw Exception('Something went wrong!');
    }
  }
}

// main to test
void main() async {
  final repository = JobsRepository();
  final jobs = await repository.getProjectAdv();
  print(jobs.length);
  for (final job in jobs) {
    final stringa = StringBuffer();
    final titles = job.projectProperties?.codice.title;
    for (final title in titles!) {
      stringa.write(title.plainText);
    }
    print(stringa);
  }
}
