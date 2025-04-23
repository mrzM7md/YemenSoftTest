import 'package:equatable/equatable.dart';

class SuccessModel<T> extends Equatable {
  final String message;
  final int statusCode;
  final T data;
  const SuccessModel({ required this.statusCode, required this.message, required this.data});


  @override
  List<Object?> get props => [statusCode, message, data];

}