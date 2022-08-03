import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'science_event.dart';
part 'science_state.dart';

@injectable
class ScienceBloc extends Bloc<ScienceEvent, ScienceState> {
  final NewsRepo _newsRepo;
  ScienceBloc(this._newsRepo) : super(ScienceInitial()) {
    on<GetScienceNews>((event, emit) async {
      emit(ScienceLoading());

      final response = await _newsRepo.getCategoryNews(
          cat: ApiCategory.science, country: Global.lang);

      final newState = response.fold((success) {
        return ScienceSuccess(success);
      }, (failure) {
        return ScienceError(failure);
      });

      emit(newState);
    });
  }
}
