import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'entertainment_event.dart';
part 'entertainment_state.dart';

@injectable
class EntertainmentBloc extends Bloc<EntertainmentEvent, EntertainmentState> {
  final NewsRepo _newsRepo;
  EntertainmentBloc(this._newsRepo) : super(EntertainmentInitial()) {
    on<GetEntertainmentNews>((event, emit) async {
      emit(EntertainmentLoading());

      final response = await _newsRepo.getCategoryNews(
          country: Global.lang, cat: ApiCategory.entertainment);

      final newState = response.fold((success) {
        return EntertainmentSuccess(success);
      }, (failure) {
        return EntertainmentError(failure);
      });

      emit(newState);
    });
  }
}
