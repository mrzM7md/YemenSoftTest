import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemen_soft_test/features/login/presentaion/widgets/language_selection_dialog.dart';

void showLanguagesDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LanguageSelectionAlertDialog();
    },
  );
}