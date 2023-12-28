import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/utils/service_locator.dart';
import 'package:todo/features/auth/domain/usecases/register_user_with_email_and_password_use_case.dart';
import 'package:todo/features/auth/presentation/manager/register_user_with_email_and_password_cubit/register_user_with_email_and_password_cubit.dart';
import 'package:todo/features/auth/presentation/view/auth%20view/auth_view.dart';
import 'package:todo/features/home/presentation/view/create_category_view.dart';
import 'package:todo/features/home/presentation/view/home_view.dart';
import 'package:todo/features/index/presentation/view/edit%20task%20view/edit_task_view.dart';
import 'package:todo/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:todo/features/profile/presentation/view/settings%20view/settings_view.dart';
import 'package:todo/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kOnboardingView = '/onboarding';
  static const kAuthView = '/auth';
  static const kHomeView = '/home';
  static const kCreateCategoryView = '/create_category';
  static const kEditTaskView = '/edit_task';
  static const kSettingsView = '/settings';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingView,
        pageBuilder: (context, state) => screenTransition(
          state,
          const OnboardingView(),
        ),
      ),
      GoRoute(
        path: kAuthView,
        pageBuilder: (context, state) => screenTransition(
          state,
          BlocProvider(
            create: (context) => RegisterUserWithEmailAndPasswordCubit(
              getIt.get<RegisterUserWithEmailAndPasswordUseCase>(),
            ),
            child: const AuthView(),
          ),
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => screenTransition(
          state,
          const HomeView(),
        ),
      ),
      GoRoute(
        path: kCreateCategoryView,
        pageBuilder: (context, state) => screenTransition(
          state,
          const CreateCategoryView(),
        ),
      ),
      GoRoute(
        path: kEditTaskView,
        pageBuilder: (context, state) => screenTransition(
          state,
          const EditTaskView(),
        ),
      ),
      GoRoute(
        path: kSettingsView,
        pageBuilder: (context, state) => screenTransition(
          state,
          const SettingsView(),
        ),
      ),
    ],
  );
}

CustomTransitionPage<void> screenTransition(
    GoRouterState state, Widget screen) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: screen,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}
