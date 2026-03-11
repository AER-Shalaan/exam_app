import 'package:exam_app/core/values/Custom_Text_Filde.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/feature/sign_up/presentation/screens/sigin_up.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isRememberMe = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appBar)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            CustomTextFilde(
              hint: AppStrings.hintTextemail,
              isPassword: false,
              controller: TextEditingController(),
              isemail: true,
            ),
            Gap(10),
            CustomTextFilde(
              hint: AppStrings.hintTextpass,
              isPassword: true,
              controller: TextEditingController(),
              isemail: false,
            ),
            Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isRememberMe,
                      builder: (context, value, child) {
                        return SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: value,
                            activeColor: Colors.blue,
                            onChanged: (newValue) {
                              isRememberMe.value = newValue ?? false;
                            },
                          ),
                        );
                      },
                    ),
                    const Gap(8),
                    const Text(
                      AppStrings.rememberMe,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SiginUp()),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text(
                    AppStrings.forgotPasswordTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff02369C),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SiginUp()),
                );
              },
              child: const Text(
                AppStrings.loginTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Gap(12),
            Center(
              child: Row(
                children: [
                  const Gap(20),
                  Center(child: const Text(AppStrings.dontAcont)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SiginUp()),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      AppStrings.signUpTitle,
                      style: TextStyle(
                        color: Color(0xff02369C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
