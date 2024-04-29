import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/repository/product_owner_repository.dart';

import '../../../core/core.dart';
import '../../../core/exception/app_exception.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/data/repository/auth_repository.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) {
        final bloc = SplashBloc(
          authRepository: authRepository,
          productOwnerRepository: productOwnerRepository,
          context: context,
        );

        bloc.add(SplashStarted());
        return bloc;
      },
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          Helper.log(state.toString());
          if (state is SplashSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home2,
              (route) => false,
            );
          } else if (state is SplashError) {
            if (state.exception is UnauthorizedException) {
              await authRepository.signOut().then(
                (value) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.loginWithSms,
                    (route) => false,
                  );
                },
              );
            }
          }
        },
        child: Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Blurred Overlay
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ), // Adjust the blur intensity
                  child: Container(
                    color: Colors.black.withOpacity(
                      0.4,
                    ), // Adjust the opacity as needed
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/splash/splashLogo.png',
                          width: 120,
                          height: 120,
                        ),
                      ],
                    ).animate().scale(delay: 700.ms).fadeIn(),
                    const Gap(8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'شرکت آریا بنادر ایرانیان',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).animate().slideY(delay: 1200.ms).fadeIn(),
                    const Gap(8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'خدمات ذینفعان',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).animate().slideY(delay: 1700.ms).fadeIn(),
                    const Gap(8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Future Per Networks',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).animate().slideY(delay: 2200.ms).fadeIn(),
                    const Gap(8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'FPN Beneficial',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).animate().slideY(delay: 2700.ms).fadeIn(),
                    BlocBuilder<SplashBloc, SplashState>(
                      builder: (context, state) {
                        Helper.log('splash state is $state');
                        if (state is SplashLoading || state is SplashInitial) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else if (state is SplashError &&
                            state.exception.message != null) {
                          return Column(
                            children: [
                              Text(
                                state.exception.message.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      return CustomButton(
                                        onPressed: () {
                                          BlocProvider.of<SplashBloc>(context)
                                              .add(
                                            SplashStarted(),
                                          );
                                        },
                                        borderRadius: 18,
                                        width: 86,
                                        height: 36,
                                        showShadow: false,
                                        backgroundColor: Colors.red,
                                        child: const Text(
                                          'تلاش مجدد',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 54),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
