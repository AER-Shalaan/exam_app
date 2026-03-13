import 'package:exam_app/features/login_screen/domain/usecases/login_usecase.dart';
import 'package:exam_app/features/login_screen/presentation/cubit/login_events.dart';
import 'package:exam_app/features/login_screen/presentation/cubit/login_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoEvent extends Cubit<LoginScreenState> {
  DoEvent(this._getUserusecase) : super(LoginInitial());

  final GetUserusecase _getUserusecase;
  late String _email;
  final PageController pageController = PageController();

  int _currentPage = 0;

  void _nextPage() {
    if (pageController.hasClients) {
      _currentPage++;
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void doEvent(LoginEvents event) {
    switch (event) {
      case LoginEmailEvent():
        _sendEmail(event.email);
        break;
      case PasswordCodeEvent():
        _enterPassword(event.password);

        break;
      case GetUser():
        throw UnimplementedError();
    }
  }

  void _enterPassword(String password) {}
  void _sendEmail(String email) {}
}
