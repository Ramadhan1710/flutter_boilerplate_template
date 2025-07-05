import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate_template/routes/route_paths.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/state/base_ui_state.dart';
import '../../../../di/component/service_locator.dart';
import '../bloc/auth/auth_cubit.dart';
import '../../../../core/helpers/session/base_session_helper.dart';
import '../../../../core/widgets/inputs/custome_password_form_field.dart';
import '../../../../core/widgets/inputs/custome_text_form_field.dart';
import '../bloc/auth/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseUiState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final AuthCubit _authCubit;

  @override
  void initState() {
    _authCubit = context.read<AuthCubit>();
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Proses login
      final email = emailController.text;
      final password = passwordController.text;
      debugPrint('Email: $email | Password: $password');
      _authCubit.login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authCubit,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            context.go(RoutePaths.splash);
          } else if (state is AuthLoginFailure) {
            showErrorMessage(state.error);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 32),
                      CustomTextFormField(
                        label: 'Email',
                        hintText: 'example@email.com',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        prefixIcon: const Icon(Icons.email),
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Email wajib diisi'
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      CustomPasswordFormField(
                        label: 'Password',
                        controller: passwordController,
                        hintText: 'Masukkan password kamu',
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Password wajib diisi'
                                    : null,
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        onPressed: _submit,
                        text: 'Login',
                        type: ButtonType.text,
                        color: AppColors.primary,
                        isLoading: _authCubit.state is AuthLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
