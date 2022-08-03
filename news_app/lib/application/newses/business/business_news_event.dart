part of 'business_news_bloc.dart';

@immutable
abstract class BusinessNewsEvent {}

class GetBusinessNews extends BusinessNewsEvent {
  GetBusinessNews();
}
