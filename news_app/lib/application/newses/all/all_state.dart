part of 'all_bloc.dart';

abstract class AllState extends Equatable {
  const AllState();

  @override
  List<Object> get props => [];
}

class AllInitial extends AllState {}

class AllLoading extends AllState {}

class AllSuccess extends AllState {
  NewsModel newsModel;
  AllSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class AllError extends AllState {
  MainFailure failure;
  AllError(this.failure);
  @override
  List<Object> get props => [failure];
}
