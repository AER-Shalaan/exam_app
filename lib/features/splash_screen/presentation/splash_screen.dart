import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeLogo;
  late Animation<double> _fadeImage;
  late Animation<Offset> _slideLogo;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeLogo = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideLogo = Tween<Offset>(
      begin: const Offset(0, .3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeImage = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) async {
      final navigator = Navigator.of(context);
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 2));
        navigator.pushReplacementNamed(AppRoutes.loginViewRouteName);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(250),

            /// Logo fade + slide
            SlideTransition(
              position: _slideLogo,
              child: FadeTransition(
                opacity: _fadeLogo,
                child: Image.asset(Assets.assetsImagesExamSplash, height: 100),
              ),
            ),
            Gap(200),
            FadeTransition(
              opacity: _fadeImage,
              child: Center(
                child: Text(
                  'Study…Test…Succeed',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
