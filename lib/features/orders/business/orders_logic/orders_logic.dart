import 'package:yemen_soft_test/features/orders/data/models/order_response_model.dart';

import 'base_orders_logic.dart';

class OrdersLogic implements BaseOrdersLogic {
  final List<OrderResponseModel> _orders = [];
  @override
  List<OrderResponseModel> getOrders() => _orders;

  @override
  void setOrders({required List<OrderResponseModel> orders}){
    _orders.clear();
    _orders.addAll(orders);
  }
}