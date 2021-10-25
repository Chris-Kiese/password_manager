import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_manager/src/model/account/model.dart';
import 'package:password_manager/src/model/account/notifier.dart';

final accountProvider = StateNotifierProvider<AccountNotifier, List<Account>>(
    (ref) => AccountNotifier([]));
