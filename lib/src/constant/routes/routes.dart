import 'package:password_manager/src/pages/home/home.dart';

const homeRoute = '/';
const settingsRoute = '/settings';
const vaultRoute = '/vault';
const generatorRoute = '/generator';

//TODO: Configure Routes after pages are created.
final routes = {
  homeRoute: (context) => const HomePage()
  //vaultRoute: (context) => VaultPage(),
  //generatorRoute: (context) => GeneratorPage(),
  //settingsRoute: (context) => SettingsPage(),
};
