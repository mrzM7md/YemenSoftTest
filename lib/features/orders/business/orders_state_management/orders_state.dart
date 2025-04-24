part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class GetOrdersState extends OrdersState {
  final bool isLoaded;
  final bool isSuccess;
  final String message;

  GetOrdersState({required this.isLoaded, required this.isSuccess, required this.message});
}