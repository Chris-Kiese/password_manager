import 'package:flutter/material.dart';
import 'package:password_manager/src/model/account/account.dart';
import 'package:password_manager/src/pages/vault/components/account_card.dart';

class AccountList extends StatelessWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Account> mockData = [
      Account('name', 'username', 'password'),
      Account('name2', 'username2', 'password2')
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 2.5,
        ),
        itemCount: mockData.length,
        itemBuilder: (context, index) => AccountCard(account: mockData[index]),
      ),
    );
  }
}
