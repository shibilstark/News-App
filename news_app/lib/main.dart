import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/application/newses/all/all_bloc.dart';
import 'package:news_app/application/newses/business/business_news_bloc.dart';
import 'package:news_app/application/newses/entertainment/entertainment_bloc.dart';
import 'package:news_app/application/newses/genaral/general_bloc.dart';
import 'package:news_app/application/newses/health/health_bloc.dart';
import 'package:news_app/application/newses/science/science_bloc.dart';
import 'package:news_app/application/newses/sports/sports_bloc.dart';
import 'package:news_app/application/newses/technology/tecknology_bloc.dart';
import 'package:news_app/application/newses/top/top_bloc.dart';
import 'package:news_app/application/theme/theme_bloc.dart';
import 'package:news_app/core/themes.dart';
import 'package:news_app/domain/db/language.dart';
import 'package:news_app/domain/injectable/injectable.dart';
import 'package:news_app/presentation/routes/routes.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  await Hive.initFlutter();
  await configureInjection();

  if (!Hive.isAdapterRegistered(NewsLanguageAdapter().typeId)) {
    Hive.registerAdapter(NewsLanguageAdapter());
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<TopBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AllBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<BusinessNewsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<EntertainmentBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GeneralBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HealthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SportsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ScienceBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TecknologyBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themState) {
          return ScreenUtilInit(
              designSize: const Size(360, 800),
              splitScreenMode: true,
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: _appRouter.onGenerateRoute,
                  theme:
                      themState.isDark ? MyTheme.darkTheme : MyTheme.lightTheme,
                );
              });
        },
      ),
    );
  }
}
