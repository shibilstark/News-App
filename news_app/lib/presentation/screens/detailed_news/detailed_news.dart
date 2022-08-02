import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/domain/model/news_model/news_model.dart';

class DetailesNews extends StatelessWidget {
  const DetailesNews({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(),
        ),
      ),
    );
  }
}
