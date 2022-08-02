import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/application/newses/top/top_bloc.dart';
import 'package:news_app/application/theme/theme_bloc.dart';
import 'package:news_app/core/themes.dart';
import 'package:news_app/domain/injectable/injectable.dart';
import 'package:news_app/presentation/routes/routes.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  await Hive.initFlutter();
  await configureInjection();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: softBlack,
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
