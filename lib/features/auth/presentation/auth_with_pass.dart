import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/features/auth/data/repository/auth_repository.dart';
import 'package:porduct_owner/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../core/utils/helper.dart';
import '../../../core/utils/routes.dart';
import '../../../core/widgets/custom_button.dart';

class AuthWithPassScreen extends StatefulWidget {
  const AuthWithPassScreen({super.key});

  @override
  State<AuthWithPassScreen> createState() => _AuthWithPassScreenState();
}

class _AuthWithPassScreenState extends State<AuthWithPassScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) {
        final bloc = AuthBloc(
          authRepository: authRepository,
          context: context,
        );

        return bloc;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/background.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff406CB1),
                                Color(0xff203659),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            'assets/images/splash/splashTitle.png',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 64, 32, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          alignLabelWithHint: true,
                          fillColor: const Color(0xffECECEC),
                          filled: true,
                          hintText: 'نام کاربری',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "نام کاربری را وارد کنید";
                          }

                          return null;
                        },
                      ),
                      const Gap(18),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          alignLabelWithHint: true,
                          fillColor: const Color(0xffECECEC),
                          filled: true,
                          hintText: 'رمز عبور',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "رمز عبور را وارد کنید";
                          }

                          return null;
                        },
                      ),
                      const Gap(64),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthError) {
                            Helper.showToast(
                              title: 'خطا در ورود به حساب',
                              description: state.exception.message ??
                                  'نام کاربری یا رمز عبور نادرست است',
                              context: context,
                            );
                          } else if (state is AuthSuccess) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.home2,
                              (route) => false,
                            );
                          }
                        },
                        builder: (context, state) {
                          Helper.log('state is $state');
                          return CustomButton(
                            height: 54,
                            borderRadius: 12,
                            isLoading: state is AuthLoading,
                            backgroundColor: const Color(0xff406CB1),
                            onPressed: state is AuthLoading
                                ? () {}
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        AuthLoginWithPassStarted(
                                          username: usernameController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                            child: const Text(
                              'ورود',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
