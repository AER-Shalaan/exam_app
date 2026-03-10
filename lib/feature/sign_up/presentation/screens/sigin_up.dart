import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/feature/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SiginUp extends StatefulWidget {
  const SiginUp({super.key});

  @override
  State<SiginUp> createState() => _SiginInState();
}

class _SiginInState extends State<SiginUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  setUserCubit setUser = getIt.get<setUserCubit>();

  @override
  Widget build(BuildContext context) {
    setUser.setUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.signUpTitle),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.assetsIconsArrowBack),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: userNameController,
                  validator: (value) => AppValidation.validateRequired(value),
                  decoration: InputDecoration(
                    hintText: "Enter you user name ",
                    label: Text("User name"),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            AppValidation.validateRequired(value),
                        controller: firstNameController,
                        decoration: InputDecoration(
                          hintText: "Enter first name ",
                          label: Text("First name"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            AppValidation.validateRequired(value),
                        controller: lastNameController,
                        decoration: InputDecoration(
                          hintText: "Enter last name ",
                          label: Text("Last name"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  validator: (value) => AppValidation.validateEmail(value),
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter you email ",
                    label: Text("Email"),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            AppValidation.validatePassword(value),
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Enter password ",
                          label: Text("Password"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            AppValidation.validatePasswordConfirmation(
                              passwordController.text,
                              value,
                            ),
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm password ",
                          label: Text("Confirm password"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  validator: (value) => AppValidation.validatePhone(value),
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    hintText: "Enter phone number ",
                    label: Text("Phone number"),
                  ),
                ),
                const SizedBox(height: 48),
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint("Success");
                    }
                  },
                  child: Text("Signup"),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyles.bodyRegular16,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(
                        //   context,
                        // ).pushNamed(AppRoutes.loginViewRouteName);
                      },
                      child: Text(
                        "Login",
                        style: TextStyles.bodyRegular16.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                // Text.rich(
                //   TextSpan(
                //     text:
                //     children: [
                //       TextSpan(
                //         text:
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
