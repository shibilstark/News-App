import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/application/newses/top/top_bloc.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/domain/core/keys/strings.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/presentation/routes/routes.dart';
import 'package:news_app/presentation/widgets/gap.dart';
import 'package:news_app/presentation/widgets/theme_button.dart';

class TopNewsBody extends StatelessWidget {
  const TopNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sm, horizontal: 10.sm),
      child: BlocBuilder<TopBloc, TopState>(
        builder: (context, state) {
          if (state is TopLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TopSuccess) {
            final List<Article> articles = state.newsModel.articles!;
            return RefreshIndicator(
              onRefresh: () async => context.read<TopBloc>().add(GetTopNews()),
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

class NewsTileWIdget extends StatelessWidget {
  const NewsTileWIdget({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.sm),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/detailed',
              arguments: ScreenArgs(args: {'article': article}));
        },
        child: Container(
          height: 170.sm,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 3.sm, horizontal: 3.sm),
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.sm),
                    child: FadeInImage(
                        fadeInDuration: Duration(milliseconds: 100),
                        fit: BoxFit.cover,
                        imageErrorBuilder: ((context, error, stackTrace) =>
                            Image.asset(
                              "assets/dummy.jpg",
                              fit: BoxFit.cover,
                            )),
                        placeholderErrorBuilder:
                            ((context, error, stackTrace) => Image.asset(
                                  "assets/dummy.jpg",
                                  fit: BoxFit.cover,
                                )),
                        image: article.urlToImage == null
                            ? NetworkImage(
                                "https://v3b4d4f5.rocketcdn.me/wp-content/uploads/1/What-is-WebP-and-how-to-use-this-image-format-in-WordPress.png")
                            : NetworkImage(article.urlToImage!),
                        placeholder: AssetImage("assets/dummy.jpg")),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sm, horizontal: 3.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 115.sm,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 115.sm,
                              child: Text(
                                article.title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 16.sm,
                                        // overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5),
                              ),
                            ),
                            // Text(
                            //   "SJfdasjdflkjasldfjajfsdjalsdjfkasjdfaksjfdklasjdfkasjdfkaj",
                            //   style:
                            //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                            //             fontSize: 14.sm,
                            //             letterSpacing: 0.5,
                            //             color: Theme.of(context)
                            //                 .textTheme
                            //                 .bodyLarge!
                            //                 .color!
                            //                 .withOpacity(0.6),
                            //             overflow: TextOverflow.fade,
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            // ),
                            // ThemModeButton()
                          ],
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      // Builder(builder: (context) {
                      //   final time = article.publishedAt!.split("T").first;

                      //   return Text(
                      //     time,
                      //     style: TextStyle(
                      //         fontSize: 12.sm,
                      //         letterSpacing: 0.5,
                      //         // color: Color.fromARGB(255, 255, 101, 101)
                      //         //     .withOpacity(0.8),
                      //         fontWeight: FontWeight.bold),
                      //   );
                      // }),
                      // Gap(W: 5.sm),
                      // article.author != null
                      //     ? LimitedBox(
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             Icon(
                      //               Icons.edit_note,
                      //               size: 15.sm,
                      //               color: Theme.of(context).cardColor,
                      //             ),
                      //             Gap(W: 5.sm),
                      //             Container(
                      //               child: Text(
                      //                 article.author!,
                      //                 style: TextStyle(
                      //                     overflow: TextOverflow.clip,
                      //                     fontSize: 12.sm,
                      //                     letterSpacing: 0.5,
                      //                     color: Color.fromARGB(
                      //                             255, 255, 101, 101)
                      //                         .withOpacity(0.8),
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     : SizedBox(),
                      //   ],
                      // ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(builder: (context) {
                            final time = article.publishedAt!.split("T").first;

                            return Text(
                              time,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 12.sm,
                                      letterSpacing: 0.5,
                                      // color: Color.fromARGB(255, 255, 101, 101)
                                      //     .withOpacity(0.8),
                                      fontWeight: FontWeight.bold),
                            );
                          }),
                          Gap(H: 5.sm),
                          article.author != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.edit_note,
                                      size: 15.sm,
                                      color: Theme.of(context).cardColor,
                                    ),
                                    Gap(W: 5.sm),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2),
                                      child: Text(
                                        article.author!,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 12.sm,
                                            letterSpacing: 0.5,
                                            color: Color.fromARGB(
                                                    255, 255, 101, 101)
                                                .withOpacity(0.8),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )
                              : SizedBox(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Text("Test"),
      ),
    );
  }
}
