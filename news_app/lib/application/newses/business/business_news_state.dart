part of 'business_news_bloc.dart';

@immutable
abstract class BusinessNewsState {}

class BusinessNewsInitial extends BusinessNewsState {}

class BusinessNewsLoading extends BusinessNewsState {}

class BusinessNewsSuccess extends BusinessNewsState {
  NewsModel newsModel;
  BusinessNewsSuccess(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}

class BusinessNewsError extends BusinessNewsState {
  MainFailure failure;
  BusinessNewsError(this.failure);
  @override
  List<Object> get props => [failure];
}
