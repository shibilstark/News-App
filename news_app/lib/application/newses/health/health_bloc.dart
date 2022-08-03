import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'health_event.dart';
part 'health_state.dart';

@injectable
class HealthBloc extends Bloc<HealthEvent, HealthState> {
  final NewsRepo _newsRepo;
  HealthBloc(this._newsRepo) : super(HealthInitial()) {
    on<GetHealthNews>((event, emit) async {
      emit(HealthLoading());

      final response = await _newsRepo.getCategoryNews(
          cat: Global.lang, country: ApiCountry.india);

      final newState = response.fold((success) {
        return HealthSuccess(success);
      }, (failure) {
        return HealthError(failure);
      });

      emit(newState);
    });
  }
}
