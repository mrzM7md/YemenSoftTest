import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/images.dart';
import '../../../../generated/l10n.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(noDataImage),
        SizedBox(height: 10.h,),
        Text(S.of(context).no_orders_yet, style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 5.h,),
        Text(S.of(context).You_dont_have_any_orders_in_your_history),
      ],
    );
  }
}
