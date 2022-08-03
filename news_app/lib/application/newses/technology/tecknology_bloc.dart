import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'tecknology_event.dart';
part 'tecknology_state.dart';

@injectable
class TecknologyBloc extends Bloc<TecknologyEvent, TecknologyState> {
  final NewsRepo _newsRepo;
  TecknologyBloc(this._newsRepo) : super(TecknologyInitial()) {
    on<GetTechNews>((event, emit) async {
      emit(TecknologyLoading());

      final response = await _newsRepo.getCategoryNews(
          cat: ApiCategory.technology, country: Global.lang);

      final newState = response.fold((success) {
        return TecknologySuccess(success);
      }, (failure) {
        return TecknologyError(failure);
      });

      emit(newState);
    });
  }
}
