import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/application/newses/technology/tecknology_bloc.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/presentation/screens/news_views/top_news/top_news.dart';
import 'package:news_app/presentation/widgets/gap.dart';

class TechNewsBody extends StatelessWidget {
  const TechNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sm, horizontal: 10.sm),
      child: BlocBuilder<TecknologyBloc, TecknologyState>(
        builder: (context, state) {
          if (state is TecknologyLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TecknologySuccess) {
            final List<Article> articles = state.newsModel.articles!;
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<TecknologyBloc>().add(GetTechNews()),
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    NewsTileWIdget(article: articles[index]),
                itemCount: articles.length,
                separatorBuilder: (context, index) => Gap(H: 5.sm),
              ),
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
