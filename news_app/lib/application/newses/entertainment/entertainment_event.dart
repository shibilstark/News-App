part of 'entertainment_bloc.dart';

@immutable
abstract class EntertainmentEvent {}

class GetEntertainmentNews extends EntertainmentEvent {
  GetEntertainmentNews();
}
