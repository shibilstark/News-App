part of 'sports_bloc.dart';

@immutable
abstract class SportsState {}

class SportsInitial extends SportsState {}

class SportsLoading extends SportsState {}

class SportsSuccess extends SportsState {
  NewsModel newsModel;
  SportsSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class SportsError extends SportsState {
  MainFailure failure;
  SportsError(this.failure);
  @override
  List<Object> get props => [failure];
}
