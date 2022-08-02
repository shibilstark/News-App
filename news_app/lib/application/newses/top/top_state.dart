part of 'top_bloc.dart';

abstract class TopState extends Equatable {
  const TopState();

  @override
  List<Object> get props => [];
}

class TopInitial extends TopState {}

class TopLoading extends TopState {}

class TopSuccess extends TopState {
  NewsModel newsModel;
  TopSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class TopError extends TopState {
  MainFailure failure;
  TopError(this.failure);
  @override
  List<Object> get props => [failure];
}
