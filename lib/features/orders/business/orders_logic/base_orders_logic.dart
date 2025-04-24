import '../../data/models/order_response_model.dart';

abstract class BaseOrdersLogic {
  List<OrderResponseModel> getOrders ();
  void setOrders({required List<OrderResponseModel> orders});
}