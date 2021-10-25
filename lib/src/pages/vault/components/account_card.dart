import 'package:flutter/material.dart';
import 'package:password_manager/src/model/account/model.dart';
import 'package:password_manager/src/pages/vault/components/account_info.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key, required this.account}) : super(key: key);

  final Account account;

  //Build the Widget
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          _showMenu(context);
        },
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.black),
            child: _buildDismissable(context),
          ),
        ));
  }

  Future<dynamic> _showMenu(BuildContext context) {
    return showMenu(
      position: const RelativeRect.fromLTRB(10, 0, 0, 0),
      items: <PopupMenuEntry>[
        PopupMenuItem(
            child: Column(
          children: [
            TextButton(
                child: Row(children: const <Widget>[
                  Icon(Icons.edit),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Edit')
                ]),
                onPressed: () async {
                  //TODO: edit account
                }),
            TextButton(
                child: Row(children: const <Widget>[
                  Icon(Icons.delete),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Delete')
                ]),
                onPressed: () {
                  //TODO: delete account
                })
          ],
        ))
      ],
      context: context,
    );
  }

  Widget _buildDismissable(BuildContext context) {
    return Dismissible(
      key: Key('${account.id}'),
      background: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
      ),
      secondaryBackground: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          //TODO: delete account
        } else {
          //TODO: Edit Acchount
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            account.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const SizedBox(height: 7),
          AccountInfo(account: account),
        ],
      ),
    );
  }
}
