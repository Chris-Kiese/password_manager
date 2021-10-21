import 'package:flutter/material.dart';
import 'package:password_manager/src/model/account/account.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(children: <Widget>[
            const SizedBox(width: 10),
            account.username!.isNotEmpty
                ? _buildUsername()
                : const SizedBox(height: 10),
            const SizedBox(height: 10),
            _buildPassword(),
          ]),
        ),
      ],
    );
  }

  Widget _buildUsername() {
    return Row(
      children: [
        const SizedBox(width: 20),
        const Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Text(
          account.username ?? '',
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _buildPassword() {
    return Row(
      children: [
        const SizedBox(width: 26),
        const Icon(
          Icons.vpn_key,
          color: Colors.white,
        ),
        const SizedBox(
          width: 14,
        ),
        Text(
          account.password,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
