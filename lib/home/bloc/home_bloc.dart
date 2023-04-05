import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notion_query_api/notion_query_api.dart';

import 'package:olfapp/constants/app_constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoaded>((event, emit) async {
      emit(HomeLoadInProgress());
      try {
        final jobs = await _api.query(databaseId: jobsDatabaseId);
        final projects = await _api.query(databaseId: projectsDatabaseId);
        emit(HomeNotionObjectsLoadSuccess(
          jobs: jobs,
          projects: projects,
        ));
      } catch (e) {
        emit(HomeNotionObjectsLoadFailure());
      }
    });
  }

  final NotionQueryApi _api =
      NotionQueryApi(apiToken: apiToken, baseUrl: baseUrl);
}
