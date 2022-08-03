import 'package:dartz/dartz.dart';
import 'package:news_app/application/newses/all/all_bloc.dart';
import 'package:news_app/domain/failures/main_failure.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';

abstract class NewsRepo {
  Future<Either<NewsModel, MainFailure>> getTopHeadlines(
      {required String country});
  Future<Either<NewsModel, MainFailure>> getAllNews();
  Future<Either<NewsModel, MainFailure>> getCategoryNews(
      {required String country, required String cat});
}
