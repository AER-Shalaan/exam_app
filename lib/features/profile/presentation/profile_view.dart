import 'dart:io';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/profile/presentation/cubit_profile/profile_cubit.dart';
import 'package:exam_app/features/profile/presentation/cubit_profile/profile_events.dart';
import 'package:exam_app/features/profile/presentation/cubit_profile/profile_states.dart';
import 'package:exam_app/features/profile/data/models/change_password_request.dart';
import 'package:exam_app/features/profile/data/models/update_profile_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  File? _selectedImage;
  bool _isInitialized = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _initControllers(UserEntity user) {
    if (!_isInitialized) {
      _usernameController.text = user.username;
      _firstNameController.text = user.firstName;
      _lastNameController.text = user.lastName;
      _emailController.text = user.email;
      _phoneController.text = user.phone;
      _isInitialized = true;
    }
  }

  void _showChangePasswordDialog(BuildContext context, ProfileCubit cubit) {
    final formKey = GlobalKey<FormState>();
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: cubit,
          child: BlocConsumer<ProfileCubit, ProfileStates>(
            listener: (context, state) {
              if (state.changePasswordState.data != null) {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(AppStrings.passwordChanged),
                    backgroundColor: AppColors.successColor,
                  ),
                );
              } else if (state.changePasswordState.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.changePasswordState.errorMessage!),
                    backgroundColor: AppColors.errorColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isLoading = state.changePasswordState.isLoading;

              return AlertDialog(
                title: const Text(AppStrings.changePassword),
                content: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: oldPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: AppStrings.oldPassword,
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? AppStrings.fieldCannotBeEmpty
                              : null,
                        ),
                        const Gap(16),
                        TextFormField(
                          controller: newPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: AppStrings.newPassword,
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? AppStrings.fieldCannotBeEmpty
                              : null,
                        ),
                        const Gap(16),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: AppStrings.confirmNewPassword,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.fieldCannotBeEmpty;
                            }
                            if (value != newPasswordController.text) {
                              return AppStrings.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => Navigator.of(dialogContext).pop(),
                    child: const Text(AppStrings.cancelBtn),
                  ),
                  FilledButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              cubit.doEvent(
                                ChangePasswordEvent(
                                  ChangePasswordRequest(
                                    oldPassword: oldPasswordController.text,
                                    password: newPasswordController.text,
                                    rePassword: confirmPasswordController.text,
                                  ),
                                ),
                              );
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            ),
                          )
                        : const Text(AppStrings.update),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..doEvent(GetProfileEvent()),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          final updateState = state.updateProfileState;
          if (updateState.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(AppStrings.profileUpdatedSuccessfully),
                backgroundColor: AppColors.successColor,
              ),
            );
          } else if (updateState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(updateState.errorMessage!),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        builder: (context, state) {
          final profileState = state.profileState;
          final updateState = state.updateProfileState;

          if (profileState.isLoading && !_isInitialized) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (profileState.errorMessage != null && !_isInitialized) {
            return Center(
              child: Text(
                profileState.errorMessage!,
                style: const TextStyle(color: AppColors.errorColor),
              ),
            );
          }

          final user = profileState.data;

          if (user == null) {
            return const Center(child: Text(AppStrings.noUserDataAvailable));
          }

          _initControllers(user);

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(24),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.lightBlue,
                          backgroundImage: _selectedImage != null
                              ? FileImage(_selectedImage!) as ImageProvider
                              : (user.profilePic != null &&
                                        user.profilePic!.isNotEmpty
                                    ? NetworkImage(user.profilePic!)
                                    : null),
                          child:
                              (_selectedImage == null &&
                                  (user.profilePic == null ||
                                      user.profilePic!.isEmpty))
                              ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: AppColors.placeHolder,
                                )
                              : null,
                        ),
                        InkWell(
                          onTap: _pickImage,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.camera_alt,
                              color: AppColors.whiteColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(32),
                  _buildEditableField(
                    label: AppStrings.userName,
                    controller: _usernameController,
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildEditableField(
                          label: AppStrings.firstName,
                          controller: _firstNameController,
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: _buildEditableField(
                          label: AppStrings.lastName,
                          controller: _lastNameController,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  _buildEditableField(
                    label: AppStrings.email,
                    controller: _emailController,
                  ),
                  const Gap(16),
                  TextFormField(
                    initialValue: '********',
                    readOnly: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppStrings.password,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: TextButton(
                        onPressed: () {
                          _showChangePasswordDialog(
                            context,
                            context.read<ProfileCubit>(),
                          );
                        },
                        child: Text(
                          AppStrings.change,
                          style: TextStyles.bodyMedium16PrimaryUnderline
                              .copyWith(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  _buildEditableField(
                    label: AppStrings.phone,
                    controller: _phoneController,
                  ),
                  const Gap(48),
                  FilledButton(
                    onPressed: updateState.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ProfileCubit>().doEvent(
                                UpdateProfileEvent(
                                  UpdateProfileRequest(
                                    username: _usernameController.text.trim(),
                                    firstName: _firstNameController.text.trim(),
                                    lastName: _lastNameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    phone: _phoneController.text.trim(),
                                    profilePic: _selectedImage,
                                  ),
                                ),
                              );
                            }
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: updateState.isLoading
                          ? AppColors.placeHolder
                          : AppColors.primary,
                    ),
                    child: updateState.isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            ),
                          )
                        : const Text(AppStrings.update),
                  ),
                  const Gap(32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return AppStrings.fieldCannotBeEmpty;
        }
        return null;
      },
    );
  }
}
