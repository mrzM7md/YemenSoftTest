import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemen_soft_test/core/values/colors.dart';

import '../../generated/l10n.dart';

String getSimpleNum({required String? num}){
  if(num == null || int.tryParse(num) == null){
    return "0.00";
  }
  return int.parse(num).toStringAsFixed(2);
}

String fromOrderStatusNumToWord(String status, BuildContext context){
  switch(status){
    case "1":
      return S.of(context).new_status;
    case "2":
      return S.of(context).on_delivering;
    case "3":
      return S.of(context).delivered;
    default:
      return S.of(context).returned;
  }

}

Color fromOrderStatusNumToColor(String status) {
  switch (status) {
    case "1":
      return Colors.green;
    case "2":
      return Color(mainAppColor);
    case "3":
      return Colors.grey;
    default:
      return Color(redColor);
  }
}