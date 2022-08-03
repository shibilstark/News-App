import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants.dart';

import 'package:news_app/infrastrucutre/service/news_service.dart';
import 'package:news_app/presentation/screens/home/home_drawer.dart';
import 'package:news_app/presentation/screens/news_views/all_news/all_news.dart';
import 'package:news_app/presentation/screens/news_views/business_news/business_news.dart';
import 'package:news_app/presentation/screens/news_views/enetertainment/entertainment_news.dart';
import 'package:news_app/presentation/screens/news_views/general/general_news.dart';
import 'package:news_app/presentation/screens/news_views/health_news/health_news.dart';
import 'package:news_app/presentation/screens/news_views/science_news/science_news.dart';
import 'package:news_app/presentation/screens/news_views/sports_news/sports_news.dart';
import 'package:news_app/presentation/screens/news_views/tech/teck_news.dart';
import 'package:news_app/presentation/screens/news_views/top_news/top_news.dart';

ValueNotifier<int> _tabNotifier = ValueNotifier(0);

final GlobalKey<ScaffoldState> _key = GlobalKey();

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NewsServieces weather = NewsServieces();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: HomeDrawer(),
      appBar: PreferredSize(
        preferredSize: appbarheight,
        child: HomeAppBar(),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: _tabNotifier,
            builder: (context, int val, _) {
              return _tabViews[val];
            }),
      ),
    );
  }
}

final _tabLabels = [
  "All",
  "Top",
  "Business",
  "Enetertainment",
  "General",
  "Health",
  "Science",
  "Sports",
  "Technology",
];

const _tabViews = [
  AllNewsBody(),
  TopNewsBody(),
  BusinessNewsBody(),
  EntertainmentNewsBody(),
  GeneralNewsBody(),
  HealthNewsBody(),
  ScienceNewsBody(),
  SportsNewsBody(),
  GeneralNewsBody(),
  TechNewsBody(),
];

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabs = List.generate(
      _tabLabels.length,
      (index) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5.sm,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.sm),
          child: Container(
            constraints: BoxConstraints(minWidth: 60.sm),
            padding: EdgeInsets.symmetric(horizontal: 10.sm),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sm),
                color: Theme.of(context).cardColor.withOpacity(0.05)),
            // color: Color.fromARGB(66, 251, 251, 251)),
            child: Tab(
              text: _tabLabels[index],
            ),
          ),
        ),
      ),
    );
    return AppBar(
      // actions: [ThemModeButton()],
      leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          onPressed: () {
            _key.currentState!.openDrawer();
          }),
      elevation: 0,
      title: Text(
        "NewsApp",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      titleSpacing: 0.sm,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ValueListenableBuilder(
            valueListenable: _tabNotifier,
            builder: (context, int val, _) {
              return DefaultTabController(
                initialIndex: _tabNotifier.value,
                length: _tabLabels.length,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.sm),
                  width: double.infinity,
                  height: 50,
                  // color: Color.fromARGB(255, 32, 144, 230),
                  child: TabBar(
                      splashBorderRadius: BorderRadius.zero,
                      onTap: (value) {
                        _tabNotifier.value = value;
                        _tabNotifier.notifyListeners();
                      },
                      // controller: TabController(length: 8,vsync: TickerProvider),
                      indicatorWeight: 0.0001,
                      labelPadding: EdgeInsets.symmetric(horizontal: 5.sm),
                      isScrollable: true,
                      unselectedLabelColor: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .color!
                          .withOpacity(0.7),
                      labelColor: Theme.of(context).cardColor,
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color:
                                  Theme.of(context).cardColor.withOpacity(0.7)),
                      tabs: _tabs),
                ),
              );
            }),
      ),
    );
  }
}
