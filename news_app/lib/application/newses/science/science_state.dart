part of 'science_bloc.dart';

@immutable
abstract class ScienceState {}

class ScienceInitial extends ScienceState {}

class ScienceLoading extends ScienceState {}

class ScienceSuccess extends ScienceState {
  NewsModel newsModel;
  ScienceSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class ScienceError extends ScienceState {
  MainFailure failure;
  ScienceError(this.failure);
  @override
  List<Object> get props => [failure];
}
