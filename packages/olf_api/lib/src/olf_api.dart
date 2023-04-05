// ignore_for_file: public_member_api_docs, always_declare_return_types, type_annotate_public_apis, inference_failure_on_function_return_type

import 'dart:developer';

import 'package:notion_api/notion.dart';
import 'package:notion_api/notion/general/property.dart';
import 'package:notion_api/responses/notion_response.dart';

class OlfApi {
  factory OlfApi() {
    return _instance;
  }

  OlfApi._internal() {
    _client = NotionClient(
      token: 'secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ',
    );
  }
  late final NotionClient _client;

  static final OlfApi _instance = OlfApi._internal();

  Future<NotionResponse> getJobsPositions() async {
    return _client.databases.fetch(
      '283d2760f81548f0a7baca4b3e58d7d8',
    );
  }

  Future<NotionResponse> getFreelanceProjects() async {
    return _client.databases.fetch(
      'e6a8a6760e3d4430b20a15d16f75f92e',
    );
  }
}

void main() async {
  OlfApi api = OlfApi();

  NotionResponse response = await api.getJobsPositions();

  Map<String, Property> entries = response.database!.properties.entries;

  for (var entry in entries.entries) {
    print('${entry.key}: ${entry.value.value}');
  }
  print('\n');

  NotionResponse response2 = await api.getFreelanceProjects();

  Map<String, Property> entries2 = response2.database!.properties.entries;

  for (var entry in entries2.entries) {
    print('${entry.key}: ${entry.value.value}');
  }
}
