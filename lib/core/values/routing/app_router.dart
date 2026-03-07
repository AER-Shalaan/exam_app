import 'package:exam_app/core/values/routing/routes.dart';
import 'package:exam_app/feature/screens/home_screen.dart';
import 'package:flutter/material.dart';
class AppRouter {

static Route? generateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
        settings: setting,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text("Page Not Found")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Page Not Found"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.homeScreen, // الصفحة اللي هترجع لها
                    (route) =>
                        route.settings.name ==
                        Routes
                            .homeScreen, // الشرط: احتفظ بكل الصفحات اللي اسمها splash
                  );
                },
                child: Text("Go To Home"),
              ),
            ],
          ),
        ),
      );
  }
}

}
