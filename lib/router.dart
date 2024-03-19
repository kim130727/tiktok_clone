import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/email_screen.dart';
import 'package:tiktok_clone/features/login_screen.dart';
import 'package:tiktok_clone/features/sign_up_screen.dart';
import 'package:tiktok_clone/features/username_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    )
  ],
);
