import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yemen_soft_test/core/methods/helper_methods.dart';
import 'package:yemen_soft_test/core/methods/langs_methods.dart';
import 'package:yemen_soft_test/features/orders/data/models/order_response_model.dart';
import '../../../../../generated/l10n.dart';

class OrderCartWidget extends StatelessWidget {
  final OrderResponseModel orderResponseModel;

  const OrderCartWidget({super.key, required this.orderResponseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(10.r),
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // لون الظل مع درجة شفافية
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(
                0, 3), // إزاحة الظل أفقياً وعمودياً (هنا: 0 أفقيًا، 3 للأسفل)
          ),
        ], // لون الخلفية الداكن لزر "New" (teal)
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsetsDirectional.only(
                start: 30.r, end: 30.r, top: 10.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("#${orderResponseModel.bILLSRL}"),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(S.of(context).status),
                        Text(fromOrderStatusNumToWord(orderResponseModel.bILLTYPE.toString(), context),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            color: fromOrderStatusNumToColor(orderResponseModel.bILLTYPE.toString())
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      width: 1,
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(S.of(context).total_price),
                        Text(getSimpleNum(num: orderResponseModel.bILLAMT), style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp
                        ),),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      width: 1,
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(S.of(context).date),
                        Text(orderResponseModel.bILLDATE ?? "--", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp
                        ),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
          Container(
            width: 60.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: fromOrderStatusNumToColor(orderResponseModel.bILLTYPE.toString()),
              borderRadius: BorderRadius.only(
                topRight: !isRTL() ? Radius.circular(20) : Radius.zero,
                bottomRight: !isRTL() ? Radius.circular(20) : Radius.zero,
                topLeft: isRTL() ? Radius.circular(20) : Radius.zero,
                bottomLeft: isRTL() ? Radius.circular(20) : Radius.zero,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).order_details,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
