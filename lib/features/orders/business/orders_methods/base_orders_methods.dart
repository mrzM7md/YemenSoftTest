import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yemen_soft_test/features/orders/business/orders_logic/base_orders_logic.dart';
import 'package:yemen_soft_test/features/orders/data/models/order_request_model.dart';
import 'package:yemen_soft_test/features/orders/data/models/order_response_model.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';

abstract class BaseOrdersMethods {
  final BaseOrdersLogic baseOrdersLogic;
  final BuildContext context;
  const BaseOrdersMethods({required this.baseOrdersLogic, required this.context});

  Future<Either<ErrorModel, SuccessModel<List<OrderResponseModel>>>> getOrders({required OrderRequestModel orderRequest});
}