part of 'health_bloc.dart';

@immutable
abstract class HealthState {}

class HealthInitial extends HealthState {}

class HealthLoading extends HealthState {}

class HealthSuccess extends HealthState {
  NewsModel newsModel;
  HealthSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class HealthError extends HealthState {
  MainFailure failure;
  HealthError(this.failure);
  @override
  List<Object> get props => [failure];
}
