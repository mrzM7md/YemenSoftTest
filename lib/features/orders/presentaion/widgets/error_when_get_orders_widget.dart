import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemen_soft_test/core/methods/user_delivery_methods.dart';
import 'package:yemen_soft_test/features/orders/business/orders_state_management/orders_cubit.dart';

import '../../../../core/methods/langs_methods.dart';
import '../../data/models/order_request_model.dart';

class ErrorWhenGetOrdersWidget extends StatelessWidget {
  const ErrorWhenGetOrdersWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(onPressed: (){
          OrdersCubit.get(context).getOrders(orderRequest: OrderRequestModel(pDLVRYNO: getDeliveryUsername(), pLANGNO: "${getCurrentLanNumberFromSymbol()}"));
        }, color: Colors.redAccent,
          child: Column(
            children: [
              Text(message, style: TextStyle(color: Colors.white),),
              Icon(CupertinoIcons.refresh_thin, color: Colors.white,)
            ],
          ),),

      ],
    );;
  }
}
