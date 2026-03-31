import 'package:exam_app/core/enums/home_tab.dart';

sealed class HomeEvents {}

class ChangeNavBarTab extends HomeEvents {
  final HomeTab tab;

  ChangeNavBarTab(this.tab);
}

class SearchForSubject extends HomeEvents {
  final String query;

  SearchForSubject(this.query);
}

class GetSubjects extends HomeEvents {}
