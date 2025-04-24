import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yemen_soft_test/features/orders/business/orders_methods/base_orders_methods.dart';
import 'package:yemen_soft_test/features/orders/data/models/order_request_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final BaseOrdersMethods baseOrdersMethods;
  OrdersCubit({required this.baseOrdersMethods}) : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);

  Future<void> getOrders({required OrderRequestModel orderRequest}) async {
    emit(GetOrdersState(isLoaded: false, isSuccess: false, message: ""));

    final result = await baseOrdersMethods.getOrders(orderRequest:orderRequest);
    result.fold((l) =>
        emit(GetOrdersState(isLoaded: true, isSuccess: false, message: l.message))
    ,(r) {
          baseOrdersMethods.baseOrdersLogic.setOrders(orders: r.data);
          emit(GetOrdersState(isLoaded: true, isSuccess: true, message: r.message));
        });
  }
}
