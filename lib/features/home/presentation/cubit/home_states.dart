import 'package:exam_app/core/enums/home_tab.dart';

class HomeStates {
  final HomeTab currentTab;

  const HomeStates({this.currentTab = HomeTab.explore});

  HomeStates copyWith({HomeTab? currentTab}) {
    return HomeStates(currentTab: currentTab ?? this.currentTab);
  }
}
