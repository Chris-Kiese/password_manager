//TODO: create

import 'package:flutter/material.dart';
import 'package:password_manager/src/pages/vault/components/account_list.dart';

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
      body: const AccountList(),
    );
  }
}
