import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/core/global.dart';

import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'business_news_event.dart';
part 'business_news_state.dart';

@injectable
class BusinessNewsBloc extends Bloc<BusinessNewsEvent, BusinessNewsState> {
  final NewsRepo _newsRepo;
  BusinessNewsBloc(this._newsRepo) : super(BusinessNewsInitial()) {
    on<GetBusinessNews>((event, emit) async {
      emit(BusinessNewsLoading());

      final response = await _newsRepo.getCategoryNews(
          country: Global.lang, cat: ApiCategory.business);

      final newState = response.fold((success) {
        return BusinessNewsSuccess(success);
      }, (failure) {
        return BusinessNewsError(failure);
      });

      emit(newState);
    });
  }
}
