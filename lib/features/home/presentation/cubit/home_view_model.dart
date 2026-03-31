import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/domain/entities/get_all_subjects_entity.dart';
import 'package:exam_app/features/home/domain/use_cases/get_all_subjects_use_case.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel(this._getAllSubjectsUseCase) : super(HomeStates());

  final GetAllSubjectsUseCase _getAllSubjectsUseCase;
  void doEvent(HomeEvents event) {
    switch (event) {
      case ChangeNavBarTab():
        _changeTab(event.tab);
        break;
      case SearchForSubject():
        _search(event.query);
        break;
      case GetSubjects():
        _getSubjects();
        break;
    }
  }

  void _changeTab(HomeTab tab) {
    emit(state.copyWith(currentTab: tab));
  }

  void _search(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  Future<void> _getSubjects() async {
    emit(
      state.copyWith(
        subjectState: state.subjectState.copyWith(
          isLoadingParam: true,
          dataParam: null,
          errorMessageParam: null,
        ),
      ),
    );
    final response = await _getAllSubjectsUseCase.execute(
      token: TokenManager.token!,
    );
    switch (response) {
      case SuccessBaseResponse<GetAllSubjectsEntity>():
        emit(
          state.copyWith(
            subjectState: state.subjectState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<GetAllSubjectsEntity>():
        emit(
          state.copyWith(
            subjectState: state.subjectState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
    }
  }
}
