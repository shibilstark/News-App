import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'general_event.dart';
part 'general_state.dart';

@injectable
class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final NewsRepo _newsRepo;
  GeneralBloc(this._newsRepo) : super(GeneralInitial()) {
    on<GetGeneralNews>((event, emit) async {
      emit(GeneralLoading());

      final response = await _newsRepo.getCategoryNews(
          country: Global.lang, cat: ApiCategory.general);

      final newState = response.fold((success) {
        return GeneralSuccess(success);
      }, (failure) {
        return GeneralError(failure);
      });

      emit(newState);
    });
  }
}
