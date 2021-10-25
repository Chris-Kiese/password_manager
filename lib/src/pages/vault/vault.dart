import 'package:flutter/material.dart';
import 'package:password_manager/src/pages/vault/components/account_list.dart';
import 'package:password_manager/src/pages/vault/components/add_account_button.dart';

//TODO: change to stateful consumer? -> maybe even stateless & appbar stateful
class VaultPage extends StatefulWidget {
  const VaultPage({Key? key}) : super(key: key);

  @override
  _VaultPageState createState() => _VaultPageState();
}

class _VaultPageState extends State<VaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vault'),
        ),
        body: Stack(children: const [
          SafeArea(child: AccountList()),
          Align(
            alignment: Alignment.bottomRight,
            child: AddAccountButton(),
          )
        ]));
  }
}
