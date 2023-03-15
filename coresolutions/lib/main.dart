import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:natures_repository/natures_repository.dart';
import 'package:preference_storage/preference_storage.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authenticationRepository = AuthenticationRepository();
  final prefs = Preferences(prefs: await SharedPreferences.getInstance());
  runApp(App(
    prefs: prefs,
    authenticationRepository: authenticationRepository,
    userRepository: UserRepository(authenticationRepository, prefs),
    naturesRepository: NaturesRepository(authenticationRepository, prefs),
  ));
}
