import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

// News Model
@JsonSerializable()
class NewsModel extends Equatable {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  NewsModel copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return NewsModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, totalResults, articles];
}

// Source Model
@JsonSerializable()
class Source extends Equatable {
  final dynamic id;
  final String? name;

  const Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return _$SourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  Source copyWith({
    dynamic id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}

// Article Model
@JsonSerializable()
class Article extends Equatable {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return _$ArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return Article(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
