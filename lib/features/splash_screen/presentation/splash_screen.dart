import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeLogo;
  late final Animation<double> _fadeText;
  late final Animation<Offset> _slideLogo;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigate();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeLogo = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideLogo = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeText = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  Future<void> _navigate() async {
    await TokenManager.init();

    final hasToken = TokenManager.isLoggedIn;

    await Future.delayed(
      hasToken ? const Duration(milliseconds: 500) : const Duration(seconds: 2),
    );

    if (!mounted) return;

    final route = hasToken
        ? AppRoutes.homeViewRouteName
        : AppRoutes.loginViewRouteName;

    Navigator.pushReplacementNamed(context, route);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.3),

            SlideTransition(
              position: _slideLogo,
              child: FadeTransition(
                opacity: _fadeLogo,
                child: Image.asset(Assets.assetsImagesExamSplash, height: 100),
              ),
            ),

            SizedBox(height: height * 0.25),

            FadeTransition(
              opacity: _fadeText,
              child: const Text(
                'Study…Test…Succeed',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
