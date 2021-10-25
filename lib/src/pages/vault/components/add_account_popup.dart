import 'package:flutter/material.dart';
import 'package:password_manager/src/constant/provider/provider.dart';
import 'package:password_manager/src/constant/tags/tags.dart';
import 'package:password_manager/src/model/account/model.dart';
import 'package:password_manager/src/widget/hero_popup/custom_rect_tween.dart';
// ignore: implementation_imports
import 'package:flutter_riverpod/src/provider.dart';

class AddAccountPopup extends StatelessWidget {
  const AddAccountPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: addAccountTag,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 200, 20, 200),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          child: const SizedBox(child: _AddAccountForm()),
        ),
      ),
    );
  }
}

class _AddAccountForm extends StatefulWidget {
  const _AddAccountForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<_AddAccountForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Name')),
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Name must not be empty!';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Userame')),
                  controller: _usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Password')),
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Password must not be empty!';
                  },
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    context.read(accountProvider.notifier).add(Account(
                        _nameController.text,
                        _usernameController.text,
                        _passwordController.text));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'))
            ],
          ),
        ));
  }
}
