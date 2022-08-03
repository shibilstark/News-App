import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/infrastrucutre/service/news_repo.dart';

@LazySingleton(as: NewsRepo)
class NewsServieces implements NewsRepo {
  @override
  Future<Either<NewsModel, MainFailure>> getTopHeadlines(
      {required String country}) async {
    try {
      final Response response =
          // await Dio(BaseOptions()).get(ApiEndPoints.topHeadline(country));
          await Dio(BaseOptions()).get(ApiEndPoints.topHeadline(country));

      // log("${PersonalKeys.baseUrl}${PersonalKeys.topHeadlines}country=${ApiCountry.india}&apiKey=${PersonalKeys.key}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final news = (response.data);

        NewsModel newsModel = NewsModel.fromJson(news);

        // for (final raw in response.data) {
        //   downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }

        return Left(newsModel);
      } else {
        return Right(
            MainFailure.serverFailure(e: "", type: FailureTypes.connection));
      }
    } catch (e) {
      return Right(MainFailure.clientFailure(
          e: e.toString(), type: FailureTypes.connection));
    }
  }

  @override
  Future<Either<NewsModel, MainFailure>> getAllNews() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.everything());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final news = (response.data);

        NewsModel newsModel = NewsModel.fromJson(news);

        return Left(newsModel);
      } else {
        return Right(
            MainFailure.serverFailure(e: "", type: FailureTypes.connection));
      }
    } catch (e) {
      return Right(MainFailure.clientFailure(
          e: e.toString(), type: FailureTypes.connection));
    }
  }

  @override
  Future<Either<NewsModel, MainFailure>> getCategoryNews(
      {required String country, required String cat}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.categories(cat: cat, country: country));

      log(ApiEndPoints.categories(cat: cat, country: country));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final news = (response.data);

        NewsModel newsModel = NewsModel.fromJson(news);

        return Left(newsModel);
      } else {
        return Right(
            MainFailure.serverFailure(e: "", type: FailureTypes.connection));
      }
    } catch (e) {
      return Right(MainFailure.clientFailure(
          e: e.toString(), type: FailureTypes.connection));
    }
  }
}
