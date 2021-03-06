import 'package:password_manager/src/pages/home/home.dart';
import 'package:password_manager/src/pages/vault/vault.dart';

const homeRoute = '/';
const settingsRoute = '/settings';
const vaultRoute = '/vault';
const generatorRoute = '/generator';

//TODO: Configure Routes after pages are created.
final routes = {
  homeRoute: (context) => const HomePage(),
  vaultRoute: (context) => const VaultPage()
  //generatorRoute: (context) => GeneratorPage(),
  //settingsRoute: (context) => SettingsPage(),
};
