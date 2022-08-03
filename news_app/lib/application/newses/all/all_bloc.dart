import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

part 'all_event.dart';
part 'all_state.dart';

@injectable
class AllBloc extends Bloc<AllEvent, AllState> {
  final NewsRepo _newsRepo;
  AllBloc(this._newsRepo) : super(AllInitial()) {
    on<GetAllNews>((event, emit) async {
      emit(AllLoading());

      final response = await _newsRepo.getAllNews();

      final newState = response.fold((success) {
        return AllSuccess(success);
      }, (failure) {
        return AllError(failure);
      });

      emit(newState);
    });
  }
}
