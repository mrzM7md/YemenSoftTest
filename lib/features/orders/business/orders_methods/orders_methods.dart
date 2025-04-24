import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:yemen_soft_test/core/methods/connection_methods.dart';
import 'package:yemen_soft_test/features/orders/business/orders_logic/base_orders_logic.dart';
import 'package:yemen_soft_test/features/orders/business/orders_methods/base_orders_methods.dart';
import 'package:yemen_soft_test/features/orders/data/models/order_request_model.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';
import '../../../../core/network/server/api_constance.dart';
import '../../../../core/services/setup_service_locator.dart';
import '../../../../core/storage/locall/sqldb.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/order_response_model.dart';

class OrdersMethods implements BaseOrdersMethods {
  @override
  final BaseOrdersLogic baseOrdersLogic;
  final BuildContext context;
  OrdersMethods({required this.baseOrdersLogic, required this.context});

  @override
  Future<Either<ErrorModel, SuccessModel<List<OrderResponseModel>>>> getOrders({required OrderRequestModel orderRequest}) async {

    try {
      if(! await isThereInternetConnectionOrDataInsideInternetConnection()){
        // get from local database
        List<OrderResponseModel> orders = await _getOrdersLocally();
        SuccessModel<List<OrderResponseModel>> successModel = SuccessModel<List<OrderResponseModel>>(statusCode: 200, message:  "", data: orders);
        return Right(successModel);
      }

      Response response = await ApiConstance.postData(url: ApiConstance.getOrdersLink, data: orderRequest.toJson());
      dynamic jsonData = jsonDecode(response.body);

      // print("Response: $response");
      if(response.statusCode >= 200 && response.statusCode < 300) {
        List<OrderResponseModel> orders = [];
        // print("Info: ${jsonData["Data"]["DeliveryBills"]}");
        if(jsonData["Data"]["DeliveryBills"] != null){
          _clearOrdersDataLocal();
          for(Map<String, dynamic> order in jsonData["Data"]["DeliveryBills"]){
            orders.add(OrderResponseModel.fromJson(order));
            _insertFromServerToLocal(OrderResponseModel.fromJson(order));
          }
        }

        if(jsonData["Result"]["ErrNo"] == 0){
          SuccessModel<List<OrderResponseModel>> successModel = SuccessModel<List<OrderResponseModel>>(statusCode: response.statusCode, message: "", data: orders);
          return Right(successModel);
        }

        if(jsonData["Result"]["ErrNo"] == 1){
          SuccessModel<List<OrderResponseModel>> successModel = SuccessModel<List<OrderResponseModel>>(statusCode: response.statusCode, message:  S.of(context).there_is_no_data_to_display, data: orders);
          return Right(successModel);
        }

        // print("F Order: $orders");
        return Left(
          ErrorModel(message: S.of(context).username_or_pass_not_correct, statusCode: 404),
        );
      }
      return Left(
        ErrorModel(message:  S.of(context).an_error_occurs, statusCode: 401),
      );

    } on Exception catch (e) {
      // print("Error When Get Orders: $e");
      return Left(
        ErrorModel(message:  S.of(context).an_error_occurs, statusCode: 500),
      );
    }
  }

  Future<List<OrderResponseModel>> _getOrdersLocally() async {
    List<OrderResponseModel> items = [];

    List<Map> response = await sl<SqlDb>().readData("SELECT * FROM 'orders' ORDER BY BILL_NO DESC");

    for (Map res in response){
      items.add(OrderResponseModel(
          bILLTYPE: res['BILL_TYPE'],
          bILLDATE: res['BILL_DATE'],
          bILLAMT: res['BILL_AMT'],
          bDLVRYTATUSFLG: res['DLVRY_STATUS_FLG'],
          bILLNO: res['BILL_NO'],
          bILLSRL: res['BILL_SRL'],
      )
      );
    }

    return items;
  }
  Future<void> _insertFromServerToLocal(OrderResponseModel order) async {
    await sl<SqlDb>().insertData("""
      INSERT INTO 'orders' VALUES (
        '${order..bILLTYPE}',
        '${order.bILLAMT}',
        '${order.bILLDATE}',
        '${order.bDLVRYTATUSFLG}',
        '${order.bILLNO}',
        '${order.bILLSRL}'
      )
    """);
  }

  Future<void> _clearOrdersDataLocal() async {
    await sl<SqlDb>().clearTableData('orders');
  }
}
