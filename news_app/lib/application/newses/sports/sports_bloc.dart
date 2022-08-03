import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'sports_event.dart';
part 'sports_state.dart';

@injectable
class SportsBloc extends Bloc<SportsEvent, SportsState> {
  final NewsRepo _newsRepo;
  SportsBloc(this._newsRepo) : super(SportsInitial()) {
    on<GetSportsNews>((event, emit) async {
      emit(SportsLoading());

      final response = await _newsRepo.getCategoryNews(
          cat: ApiCategory.sports, country: Global.lang);

      final newState = response.fold((success) {
        return SportsSuccess(success);
      }, (failure) {
        return SportsError(failure);
      });

      emit(newState);
    });
  }
}
