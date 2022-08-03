import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/application/newses/genaral/general_bloc.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/presentation/routes/routes.dart';
import 'package:news_app/presentation/screens/news_views/top_news/top_news.dart';
import 'package:news_app/presentation/widgets/gap.dart';
import 'package:news_app/presentation/widgets/theme_button.dart';

class GeneralNewsBody extends StatelessWidget {
  const GeneralNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sm, horizontal: 10.sm),
      child: BlocBuilder<GeneralBloc, GeneralState>(
        builder: (context, state) {
          if (state is GeneralLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GeneralSuccess) {
            final List<Article> articles = state.newsModel.articles!;
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<GeneralBloc>().add(GetGeneralNews()),
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
