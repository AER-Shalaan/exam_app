import 'package:equatable/equatable.dart';
import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/home/domain/entities/get_all_subjects_entity.dart';

class HomeStates extends Equatable {
  final HomeTab currentTab;
  final String searchQuery;
  final BaseState<GetAllSubjectsEntity> subjectState;

  const HomeStates({
    this.currentTab = HomeTab.explore,
    this.searchQuery = '',
    this.subjectState = const BaseState<GetAllSubjectsEntity>(),
  });

  HomeStates copyWith({
    HomeTab? currentTab,
    String? searchQuery,
    BaseState<GetAllSubjectsEntity>? subjectState,
  }) {
    return HomeStates(
      currentTab: currentTab ?? this.currentTab,
      searchQuery: searchQuery ?? this.searchQuery,
      subjectState: subjectState ?? this.subjectState,
    );
  }

  @override
  List<Object?> get props => [
        currentTab,
        searchQuery,
        subjectState,
      ];
}