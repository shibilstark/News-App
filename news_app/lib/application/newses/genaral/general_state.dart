part of 'general_bloc.dart';

@immutable
abstract class GeneralState {}

class GeneralInitial extends GeneralState {}

class GeneralLoading extends GeneralState {}

class GeneralSuccess extends GeneralState {
  NewsModel newsModel;
  GeneralSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class GeneralError extends GeneralState {
  MainFailure failure;
  GeneralError(this.failure);
  @override
  List<Object> get props => [failure];
}
