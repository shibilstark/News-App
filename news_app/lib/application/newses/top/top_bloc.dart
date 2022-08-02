import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'top_event.dart';
part 'top_state.dart';

@injectable
class TopBloc extends Bloc<TopEvent, TopState> {
  final NewsRepo _newsRepo;
  TopBloc(this._newsRepo) : super(TopInitial()) {
    on<GetTopNews>((event, emit) async {
      emit(TopLoading());

      final response =
          await _newsRepo.getTopHeadlines(country: ApiCountry.india);

      final newState = response.fold((success) {
        return TopSuccess(success);
      }, (failure) {
        return TopError(failure);
      });

      emit(newState);
    });
  }
}
