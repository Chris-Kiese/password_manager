import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_manager/src/constant/provider/provider.dart';
import 'package:password_manager/src/pages/vault/components/account_card.dart';

class AccountList extends ConsumerWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final accountList = watch(accountProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 2.5,
        ),
        itemCount: accountList.length,
        itemBuilder: (context, index) =>
            AccountCard(account: accountList[index]),
      ),
    );
  }
}
