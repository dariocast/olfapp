import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'models/models.dart';

class JobsRepository {
  static const String _baseUrl = 'https://api.notion.com/v1/';
  static const String _api_token =
      'secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ';
  static const String _database_id = '283d2760f81548f0a7baca4b3e58d7d8';
  static const String _notion_version = '2022-06-28';

  final http.Client _client;

  JobsRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<NotionObject>> getJobs() async {
    try {
      const url = '${_baseUrl}databases/$_database_id/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $_api_token',
          'Notion-Version': _notion_version,
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
      print(ex);
      print(stacktrace);
      throw Exception('Something went wrong!');
    }
  }
}

// main to test
void main() async {
  final repository = JobsRepository();
  final List<NotionObject> jobs = await repository.getJobs();
  for (final job in jobs) {
    // print('${job.properties?.name}');
    // print(job.properties?.qualifica);
    // print(job.properties?.nomeAzienda);
    // print(job.properties?.team);
    // print(job.properties?.contratto);
    // print(job.properties?.seniority);
    // print(job.properties?.retribuzione);
    // print(job.properties?.descrizioneOfferta);
    // print(job.properties?.comeCandidarsi);
    // print(job.properties?.localita);
    // print(job.properties?.urlSitoWeb);
    // print(job.properties?.jobPosted);
    if (job.properties == null) {
      print(job.id);
    }
  }
}
