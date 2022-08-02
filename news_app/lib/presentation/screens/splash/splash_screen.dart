import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/newses/top/top_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TopBloc>().add(GetTopNews());
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
