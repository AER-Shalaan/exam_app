import 'package:exam_app/core/enums/home_tab.dart';

sealed class HomeEvents {}

class ChangeNavBarIndex extends HomeEvents {
  final HomeTab tab;

  ChangeNavBarIndex(this.tab);
}

class SearchForSubject extends HomeEvents {}

class GetSubjects extends HomeEvents {}
