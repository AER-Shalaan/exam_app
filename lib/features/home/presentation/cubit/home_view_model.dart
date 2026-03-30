import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeStates());
  void doEvent(HomeEvents event) {
    switch (event) {
      case ChangeNavBarIndex():
        _changeIndex(event.tab);
        break;
      case SearchForSubject():
    }
  }

  void _changeIndex(HomeTab tab) {
    emit(state.copyWith(currentTab: tab));
  }
}
