part of 'tecknology_bloc.dart';

@immutable
abstract class TecknologyState {}

class TecknologyInitial extends TecknologyState {}

class TecknologyLoading extends TecknologyState {}

class TecknologySuccess extends TecknologyState {
  NewsModel newsModel;
  TecknologySuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class TecknologyError extends TecknologyState {
  MainFailure failure;
  TecknologyError(this.failure);
  @override
  List<Object> get props => [failure];
}
