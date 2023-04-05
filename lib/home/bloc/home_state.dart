part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeNotionObjectsLoadFailure extends HomeState {}

class HomeNotionObjectsLoadSuccess extends HomeState {
  HomeNotionObjectsLoadSuccess({
    required this.jobs,
    required this.projects,
  });

  final List<NotionObject> jobs;
  final List<NotionObject> projects;
}
