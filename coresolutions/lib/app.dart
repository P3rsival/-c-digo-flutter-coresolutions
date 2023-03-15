import 'package:authentication_repository/authentication_repository.dart';
import 'package:coresolutions/home/index/view/home_page.dart';
import 'package:coresolutions/theme/color_schemes.dart';
import 'package:coresolutions/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natures_repository/natures_repository.dart';
import 'package:preference_storage/preference_storage.dart';
import 'package:user_repository/user_repository.dart';

import 'authentication/bloc/authentication_bloc.dart';
import 'login/view/login_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
    required this.prefs,
    required this.naturesRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final Preferences prefs;
  final NaturesRepository naturesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => authenticationRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => userRepository,
        ),
        RepositoryProvider<Preferences>(
          create: (context) => prefs,
        ),
        RepositoryProvider<NaturesRepository>(
          create: (context) => naturesRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.expired:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
