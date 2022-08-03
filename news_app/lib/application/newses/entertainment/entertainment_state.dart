part of 'entertainment_bloc.dart';

@immutable
abstract class EntertainmentState {}

class EntertainmentInitial extends EntertainmentState {}

class EntertainmentLoading extends EntertainmentState {}

class EntertainmentSuccess extends EntertainmentState {
  NewsModel newsModel;
  EntertainmentSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class EntertainmentError extends EntertainmentState {
  MainFailure failure;
  EntertainmentError(this.failure);
  @override
  List<Object> get props => [failure];
}
