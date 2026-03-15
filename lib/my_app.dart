import 'package:exam_app/config/app_theme.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart'
    show SetUserCubit, SignUpCubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => getIt.get<SignUpCubit>(),
      child: MaterialApp(
        title: 'Exam App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: AppRoutes.signUpViewRouteName,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
