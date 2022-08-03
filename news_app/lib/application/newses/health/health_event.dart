part of 'health_bloc.dart';

@immutable
abstract class HealthEvent {}

class GetHealthNews extends HealthEvent {
  GetHealthNews();
}
