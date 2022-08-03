import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/newses/all/all_bloc.dart';
import 'package:news_app/application/newses/business/business_news_bloc.dart';
import 'package:news_app/application/newses/entertainment/entertainment_bloc.dart';
import 'package:news_app/application/newses/genaral/general_bloc.dart';
import 'package:news_app/application/newses/health/health_bloc.dart';
import 'package:news_app/application/newses/science/science_bloc.dart';
import 'package:news_app/application/newses/sports/sports_bloc.dart';
import 'package:news_app/application/newses/technology/tecknology_bloc.dart';

import 'package:news_app/application/newses/top/top_bloc.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/db/language.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final lang = (await DbFunctions.getCurrentLanguage());

      if (lang == null) {
        Navigator.of(context).pushReplacementNamed('/onboarding');
      } else {
        await Future.delayed(Duration(seconds: 2));
        Global.lang = lang;

        context.read<TopBloc>().add(GetTopNews());
        context.read<AllBloc>().add(GetAllNews());
        context.read<BusinessNewsBloc>().add(GetBusinessNews());
        context.read<EntertainmentBloc>().add(GetEntertainmentNews());
        context.read<GeneralBloc>().add(GetGeneralNews());
        context.read<HealthBloc>().add(GetHealthNews());
        context.read<ScienceBloc>().add(GetScienceNews());
        context.read<SportsBloc>().add(GetSportsNews());
        context.read<TecknologyBloc>().add(GetTechNews());
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
