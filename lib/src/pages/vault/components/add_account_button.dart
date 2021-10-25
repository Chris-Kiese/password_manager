import 'package:flutter/material.dart';
import 'package:password_manager/src/constant/styles/components/colors.dart';
import 'package:password_manager/src/constant/tags/tags.dart';
import 'package:password_manager/src/pages/vault/components/add_account_popup.dart';
import 'package:password_manager/src/widget/hero_popup/custom_rect_tween.dart';
import 'package:password_manager/src/widget/hero_popup/hero_dialog_route.dart';

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const AddAccountPopup();
          }));
        },
        child: Hero(
          tag: addAccountTag,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: primaryColorLight,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}
