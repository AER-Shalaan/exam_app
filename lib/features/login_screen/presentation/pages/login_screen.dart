import 'package:exam_app/core/values/app_strings.dart';

import 'package:exam_app/core/widget/custom_text_field.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),

            CustomTextFilde(
              label: AppStrings.email,
              hint: AppStrings.hintTextemail,
              isPassword: false,
              controller: emailController,
              isemail: true,
            ),

            const Gap(20),

            CustomTextFilde(
              label: AppStrings.password,
              hint: AppStrings.hintTextpass,
              isPassword: true,
              controller: passwordController,
              isemail: false,
            ),

            const Gap(12),

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
                    // Navigator.push(

                    //   context,

                    //   MaterialPageRoute(builder: (context) => forget()),
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
                // Navigator.push(

                //   context,

                //   MaterialPageRoute(builder: (context) => home viwe()),
              },
              child: const Text(
                AppStrings.loginTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.dontAcont),
                TextButton(
                  onPressed: () {
                    // Navigator.push(

                    //   context,

                    //   MaterialPageRoute(builder: (context) => signup()),
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
          ],
        ),
      ),
    );
  }
}
