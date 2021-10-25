import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_manager/src/constant/provider/provider.dart';
import 'package:password_manager/src/pages/vault/components/account_card.dart';

class AccountList extends ConsumerWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _accountList = watch(accountProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: _accountList.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                childAspectRatio: 2.5,
              ),
              itemCount: _accountList.length,
              itemBuilder: (context, index) =>
                  AccountCard(account: _accountList[index]),
            )
          : const Center(
              child: Text('No Account yet'),
            ),
    );
  }
}
