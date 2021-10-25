import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_manager/src/constant/database/database.dart';

import 'model.dart';

class AccountNotifier extends StateNotifier<List<Account>> {
  AccountNotifier([List<Account>? state]) : super(state!);

  void add(Account account) {
    //TODO: encrypt password
    db.insertAccount(account);
    notify();
  }

  void remove(int id) {
    db.deleteAccount(id);
    notify();
    //Todo: add toast
  }

  void edit(Account account) {
    //TODO: db.update(account);
    notify();
    //Todo: add toast
  }

  void getAll() async {
    state = await db.getAccounts();
  }

  void search({required String search}) async {
    state = await db.getAccounts(search: search);
  }

  void notify() async {
    state = await db.getAccounts();
  }

  List<Account> getState() {
    notify();
    return state;
  }

  int getLength() {
    return state.length;
  }
}
