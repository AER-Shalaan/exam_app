import 'package:exam_app/core/enums/home_tab.dart';

sealed class HomeEvents {}

class ChangeNavBarTabHomeEvent extends HomeEvents {
  final HomeTab tab;

  ChangeNavBarTabHomeEvent(this.tab);
}

class SearchForSubjectHomeEvent extends HomeEvents {
  final String query;

  SearchForSubjectHomeEvent(this.query);
}

class GetSubjectsHomeEvent extends HomeEvents {}
