import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';
import 'package:news_app/presentation/widgets/gap.dart';
import 'package:news_app/presentation/widgets/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailesNews extends StatelessWidget {
  const DetailesNews({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).cardColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // actions: [ThemModeButton()],
      ),
      body: SafeArea(
        child: DetailedBodyWIdget(article: article),
      ),
    );
  }
}

class DetailedBodyWIdget extends StatelessWidget {
  const DetailedBodyWIdget({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sm, horizontal: 10.sm),
        child: ListView(
          children: [
            Text(
              article.title!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 22.sm,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Gap(H: 10.sm),
            NewsImageWidget(article: article),
            Gap(H: 10.sm),
            Builder(builder: (context) {
              final time = article.publishedAt!.split("T").first;
              return Text(
                time,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12.sm,
                    letterSpacing: 0.5,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              );
            }),
            Gap(H: 10.sm),
            article.description == null && article.content == null
                ? SizedBox()
                : Text(
                    "${article.description} ${article.content}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18.sm,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.9)),
                  ),
            Gap(H: 10.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return Text(
                    article.source!.name!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12.sm,
                        letterSpacing: 0.5,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  );
                }),
                article.author != null
                    ? LimitedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.edit_note,
                              size: 15.sm,
                              color: Theme.of(context).cardColor,
                            ),
                            Gap(W: 5.sm),
                            Text(
                              article.author!,
                              style: TextStyle(
                                  fontSize: 12.sm,
                                  letterSpacing: 0.5,
                                  color: Color.fromARGB(255, 255, 101, 101)
                                      .withOpacity(0.8),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Gap(H: 20.sm),
            ElevatedButton(
              onPressed: () {
                _launchUrl(article.url!);
              },
              child: Text(
                "View Full News",
                style: TextStyle(
                    fontSize: 15.sm,
                    fontWeight: FontWeight.normal,
                    color: pureWhite),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(pureWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsImageWidget extends StatelessWidget {
  const NewsImageWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        article.urlToImage == null
            ? SizedBox()
            : ClipRRect(
                borderRadius: BorderRadius.circular(3.sm),
                child: FadeInImage(
                    fadeInDuration: Duration(milliseconds: 100),
                    imageErrorBuilder: ((context, error, stackTrace) =>
                        Image.asset(
                          "assets/dummy.jpg",
                          fit: BoxFit.cover,
                        )),
                    placeholderErrorBuilder: ((context, error, stackTrace) =>
                        Image.asset(
                          "assets/dummy.jpg",
                          fit: BoxFit.cover,
                        )),
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(article.urlToImage!),
                    placeholder: AssetImage("assets/dummy.jpg")),
              ),
      ],
    );
  }
}

Future<void> _launchUrl(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw 'Could not launch $uri';
  }
}
