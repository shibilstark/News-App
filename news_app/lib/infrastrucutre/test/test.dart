import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';

class NewsWeatherTest {
  Future<Either<MainFailure, NewsModel>> getNews() async {
    try {
      final Response response = await Dio(BaseOptions()).get(PersonalKeys.th);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final news = (response.data);

        NewsModel newsModel = NewsModel.fromJson(news);

        // for (final raw in response.data) {
        //   downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }

        log(NewsModel.fromJson(news).toString());

        return Right(newsModel);
      } else {
        return Left(
            MainFailure.serverFailure(e: "", type: FailureTypes.connection));
      }
    } catch (e) {
      return Left(MainFailure.clientFailure(
          e: e.toString(), type: FailureTypes.connection));
    }
  }

  // Future<NewsModel>
  // getNews() async {
  //   try {
  //     final Response response = await Dio(BaseOptions()).get(PersonalKeys.eg);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final downloadList = (response.data);

  //       log(NewsModel.fromJson(downloadList).toString());
  //     } else {}
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
