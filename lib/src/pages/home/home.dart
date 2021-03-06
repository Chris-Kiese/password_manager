import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:password_manager/src/constant/provider/provider.dart';
import 'package:password_manager/src/constant/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Password Manager'),
      centerTitle: true,
      elevation: 10.0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () async {
            //TODO: push settings route
          },
        )
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildVaultButton(context),
          const SizedBox(
            height: 100,
          ),
          _buildGeneratorButton(context)
        ],
      ),
    );
  }

  _buildVaultButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Enter Vault'),
      onPressed: () {
        //TODO: enter vault page
        Navigator.pushNamed(context, vaultRoute);
      },
    );
  }

  _buildGeneratorButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Generator'),
      onPressed: () {
        //TODO: enter generator page
      },
    );
  }
}
